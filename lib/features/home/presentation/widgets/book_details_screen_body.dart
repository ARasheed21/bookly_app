import 'package:flutter/material.dart';
import 'package:udemy8_bookly/features/home/presentation/widgets/book_details_section.dart';
import 'custom_book_details_app_bar.dart';
import 'similar_books_section.dart';

class BookDetailsScreenBody extends StatelessWidget {
  const BookDetailsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children:  const [
                CustomBookDetailsAppBar(),
                BookDetailsSection(),
                Expanded(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                SimilarBooksSection(),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
