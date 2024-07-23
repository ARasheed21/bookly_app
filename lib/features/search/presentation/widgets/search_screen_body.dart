
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy8_bookly/core/utils/functions/setup_service_locator.dart';
import 'package:udemy8_bookly/features/search/data/repos/search_repo_impl.dart';
import '../../../../../core/utils/styles.dart';
import '../cubits/search_cubit/search_cubit.dart';
import 'custom_search_text_field.dart';
import 'search_result_listview_bloc_builder.dart';

class SearchScreenBody extends StatelessWidget {
  SearchScreenBody({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(controller: controller, onSubmitted: (bookTitle) {
            context.read<SearchCubit>().fetchSearchedBooks(
                bookTitle: controller.text);
          },),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Search Result',
            style: Styles.textStyle18,
          ),
          const SizedBox(
            height: 16,
          ),
          const Expanded(
            child: SearchResultListViewBlocBuilder(),
          ),
        ],
      ),
    );
  }
}


