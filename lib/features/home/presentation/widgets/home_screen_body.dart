import 'package:flutter/cupertino.dart';
import 'package:udemy8_bookly/features/home/presentation/widgets/featured_books_listview.dart';
import '../../../../core/utils/styles.dart';
import 'custome_app_bar.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const[
        CustomAppBar(),
        FeaturedBooksListView(),
        SizedBox(
          height: 50,
        ),
        Text(
          'Best Seller',
          style: Styles.textStyle18,
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
