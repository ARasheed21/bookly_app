import 'package:flutter/material.dart';
import '../../../home/domain/entities/book_entity.dart';
import '../../../home/presentation/widgets/book_listview_item.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key, required this.books});
  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: books.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: BookListViewItem(book: books[index],),
          //child: SizedBox(),
        );
      },
    );
  }
}
