import 'package:udemy8_bookly/core/utils/api_service.dart';
import '../../domain/entities/book_entity.dart';
import '../models/book_model//book_model.dart';


abstract class SearchRemoteDataSource {
  Future<List<BookEntity>> fetchSearchedBooks({required String bookTitle});
}

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource{

  final ApiService apiService;
  SearchRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchSearchedBooks({required String bookTitle}) async {
    var data = await apiService.get(endPoint: 'volumes?Filtering=free-ebooks&q=intitle:$bookTitle');
    List<BookEntity> books = getBooksList(data);
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data['items']) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }

}