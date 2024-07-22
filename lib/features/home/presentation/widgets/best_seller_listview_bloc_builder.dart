
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy8_bookly/features/home/presentation/cubits/newest_books_cubit/newest_books_cubit.dart';

import '../../../../core/utils/functions/build_error_snackbar.dart';
import '../../domain/entities/book_entity.dart';
import 'best_seller_listview.dart';

class BestSellerListViewBlocBuilder extends StatefulWidget {
  const BestSellerListViewBlocBuilder({
    super.key,
  });

  @override
  State<BestSellerListViewBlocBuilder> createState() => _BestSellerListViewBlocBuilderState();
}

class _BestSellerListViewBlocBuilderState extends State<BestSellerListViewBlocBuilder> {
  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
      listener: (context, state){
        if(state is NewestBooksSuccess){
          books.addAll(state.books);
        }
        if(state is NewestBooksPaginationFailure){
          buildErrorWidget(state.errMessage);
        }
      },
      builder: (context, state) {
        if(state is NewestBooksSuccess||
            state is NewestBooksPaginationLoading ||
            state is NewestBooksPaginationFailure){
          return BestSellerListView(books:books);
        }else if (state is NewestBooksFailure){
          return Text(state.errMessage);
        }else{
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
