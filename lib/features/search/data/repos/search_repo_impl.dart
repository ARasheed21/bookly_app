import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:udemy8_bookly/core/errors/failure.dart';
import 'package:udemy8_bookly/features/search/domain/entities/book_entity.dart';

import '../../domain/repos/search_repo.dart';
import '../data_sources/search_remote_data_source.dart';


class SearchRepoImpl extends SearchRepo{

  final SearchRemoteDataSource searchRemoteDataSource;
  SearchRepoImpl(this.searchRemoteDataSource);



  @override
  Future<Either<Failure, List<BookEntity>>> fetchSearchedBooks({required String bookTitle}) async{
    try{
      List<BookEntity> bookList = await searchRemoteDataSource.fetchSearchedBooks(bookTitle: bookTitle);
      return right(bookList);
    }catch (e){
      if(e is DioException){
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

}