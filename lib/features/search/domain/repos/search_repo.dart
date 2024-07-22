import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/book_entity.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookEntity>>> fetchSearchedBooks(
      {required String bookTitle});

}
