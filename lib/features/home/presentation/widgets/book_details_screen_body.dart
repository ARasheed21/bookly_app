import 'package:flutter/material.dart';
import 'custom_book_details_app_bar.dart';
import 'custome_book_image.dart';

class BookDetailsScreenBody extends StatelessWidget {
  const BookDetailsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children:  [
                const CustomBookDetailsAppBar(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width*0.2),
                  child:  const CustomBookImage(),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
