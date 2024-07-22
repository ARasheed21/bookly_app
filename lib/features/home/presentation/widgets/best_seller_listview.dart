import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy8_bookly/features/home/domain/entities/book_entity.dart';
import 'package:udemy8_bookly/features/home/presentation/widgets/book_listview_item.dart';

import '../cubits/newest_books_cubit/newest_books_cubit.dart';

class BestSellerListView extends StatefulWidget {
  final List<BookEntity> books;
  const BestSellerListView({super.key, required this.books});

  @override
  State<StatefulWidget> createState() => _BestSellerListViewState();
}

class _BestSellerListViewState extends State<BestSellerListView> {
  late final ScrollController _scrollController;
  int nextPage = 1;
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() async{
    if (_scrollController.hasClients) {
      double maxScrollExtent = _scrollController.position.maxScrollExtent;
      double currentScrollPosition = _scrollController.position.pixels;

      double scrollPercentage = currentScrollPosition / maxScrollExtent;

      if (scrollPercentage >= 0.7) {
        if (!isLoading) {
          isLoading = true;
          await BlocProvider.of<NewestBooksCubit>(context)
              .fetchNewestBook(pageNum: nextPage++);
          isLoading = false;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: widget.books.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: BookListViewItem(book: widget.books[index]),
        );
      },
    );
  }
}
