
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:udemy8_bookly/features/home/presentation/widgets/custom_book_image.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../core/utils/app_router.dart';
import 'book_rating.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsScreen);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            const CustomBookImage(),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    children: [
                      Text(
                        'Harry Potter and the Goblet of Fire',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle20.copyWith(
                          fontFamily: kGtSectraFine,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Text(
                    'J.K. Rowling',
                    style: Styles.textStyle14,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      Text(
                        '19.99 €',
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      const BookRating(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}