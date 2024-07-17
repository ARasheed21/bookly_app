import 'package:flutter/cupertino.dart';
import 'package:udemy8_bookly/features/home/presentation/widgets/featured_books_listview.dart';

import 'custome_app_bar.dart';
import 'custome_book_image.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const[
        CustomAppBar(),
        FeaturedBooksListView(),
      ],
    );
  }
}
