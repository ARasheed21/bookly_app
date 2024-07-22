import 'package:flutter/material.dart';
import '../../domain/entities/book_entity.dart';
import '../widgets/book_details_screen_body.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key, required this.book});
  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BookDetailsScreenBody(book: book,),
      ),
    );
  }
}
