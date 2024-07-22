import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../home/domain/entities/book_entity.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
}
