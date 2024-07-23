import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy8_bookly/core/utils/functions/build_error_snackbar.dart';

import '../cubits/search_cubit/search_cubit.dart';
import 'search_result_listview.dart';

class SearchResultListViewBlocBuilder extends StatelessWidget {
  const SearchResultListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state){
        if(state is SearchFailure){
          buildErrorWidget(state.errMessage);
        }
      },
      builder: (context, state) {
        if(state is SearchSuccess){
          return SearchResultListView(books: state.books,);
        }else if(state is SearchLoading){
          return const Center(child: CircularProgressIndicator(),);
        }else {
          return const SizedBox();
        }
      },
    );
  }
}