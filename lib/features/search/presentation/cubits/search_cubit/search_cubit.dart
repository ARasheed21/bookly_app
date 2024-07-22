import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../search/domain/entities/book_entity.dart';
import '../../../domain/repos/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo searchRepo;
  SearchCubit(this.searchRepo) : super(SearchInitial());

  Future<void> fetchSearchedBooks({required String bookTitle})async{

    emit(SearchLoading());

    var result = await searchRepo.fetchSearchedBooks(bookTitle: bookTitle);

    result.fold((failure) {
      emit(SearchFailure(failure.message));
    }, (books){
      emit(SearchSuccess(books));
    });
  }
}
