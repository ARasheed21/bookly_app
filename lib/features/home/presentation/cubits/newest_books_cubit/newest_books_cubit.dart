import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../domain/entities/book_entity.dart';
import '../../../domain/use_cases/fetach_newest_books_usecase.dart';
part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  final FetchNewestBooksUseCase fetchNewestBooksUseCase;
  NewestBooksCubit(this.fetchNewestBooksUseCase) : super(NewestBooksInitial());

  Future <void> fetchNewestBook ()async{
    emit(NewestBooksLoading());
    var result = await fetchNewestBooksUseCase.call();

    result.fold((failure) {
      emit(NewestBooksFailure(failure.message));
    }, (books){
      emit(NewestBooksSuccess(books));
    });
  }
}
