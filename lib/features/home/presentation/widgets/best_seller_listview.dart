import 'package:flutter/material.dart';
import 'package:udemy8_bookly/features/home/domain/entities/book_entity.dart';
import 'package:udemy8_bookly/features/home/presentation/widgets/book_listview_item.dart';

class BestSellerListView extends StatelessWidget {
  final List<BookEntity> books;
  const BestSellerListView({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: BookListViewItem(book: books[index],),
        );
      },
    );
  }
}
