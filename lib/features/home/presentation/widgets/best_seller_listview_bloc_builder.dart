
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy8_bookly/features/home/presentation/cubits/newest_books_cubit/newest_books_cubit.dart';

import 'best_seller_listview.dart';

class BestSellerListViewBlocBuilder extends StatelessWidget {
  const BestSellerListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if(state is NewestBooksSuccess){
          return BestSellerListView(books:state.books);
        }else if (state is NewestBooksFailure){
          return Text(state.errMessage);
        }else{
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
