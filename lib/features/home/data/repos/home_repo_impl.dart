import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:udemy8_bookly/core/errors/failure.dart';
import 'package:udemy8_bookly/features/home/data/data_sources/home_local_data_source.dart';
import 'package:udemy8_bookly/features/home/data/data_sources/home_remote_data_source.dart';

import 'package:udemy8_bookly/features/home/domain/entities/book_entity.dart';

import '../../domain/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo{

  final HomeLocalDataSource homeLocalDataSource;
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl({required this.homeLocalDataSource, required this.homeRemoteDataSource});

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks({int pageNumber = 0}) async{
    List<BookEntity> bookList;
    try{
      bookList = homeLocalDataSource.fetchFeaturedBooks();
      if(bookList.isNotEmpty){
        return right(bookList);
      }
      bookList = await homeRemoteDataSource.fetchFeaturedBooks(pageNum: pageNumber);
      return right(bookList);
    }catch (e){
      if(e is DioException){
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async{
    List<BookEntity> bookList;
    try{
      bookList = homeLocalDataSource.fetchNewestBooks();
      if(bookList.isNotEmpty){
        return right(bookList);
      }
      bookList = await homeRemoteDataSource.fetchNewestBooks();
      return right(bookList);
    }catch (e){
      if(e is DioException){
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

}