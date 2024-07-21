import 'package:flutter/cupertino.dart';
import 'package:udemy8_bookly/features/home/presentation/widgets/best_seller_listview.dart';
import '../../../../core/utils/styles.dart';
import 'book_listview_item.dart';
import 'custome_app_bar.dart';
import 'featured_books_listview_bloc_builder.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CustomAppBar(),
                FeaturedBooksListViewBlocBuilder(),
                SizedBox(height: 50),
                Text(
                  'Best Seller',
                  style: Styles.textStyle18,
                ),
                SizedBox(height: 20),
                BookListViewItem(),
              ],
            ),
          ),
          const SliverFillRemaining(
            child: BestSellerListView(),
          )
        ],
      ),
    );
  }
}


