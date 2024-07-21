import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:udemy8_bookly/constants.dart';

import '../../domain/entities/book_entity.dart';

abstract class HomeLocalDataSource{
  List<BookEntity> fetchFeaturedBooks({int pageNum = 0});
  List<BookEntity> fetchNewestBooks();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource{

  @override
  List<BookEntity> fetchFeaturedBooks({int pageNum = 0}) {
    int startIndex = pageNum * 10;
    int endIndex = (pageNum + 1) * 10;

    var box = Hive.box<BookEntity>(kFeaturedBox);
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    log('start Index: $startIndex');
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var box = Hive.box<BookEntity>(kNewestBox);
    return box.values.toList();
  }

}