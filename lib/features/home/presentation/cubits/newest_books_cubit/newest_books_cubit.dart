import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../domain/entities/book_entity.dart';
import '../../../domain/use_cases/fetach_newest_books_usecase.dart';
part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  final FetchNewestBooksUseCase fetchNewestBooksUseCase;
  NewestBooksCubit(this.fetchNewestBooksUseCase) : super(NewestBooksInitial());

  Future <void> fetchNewestBook ({int pageNum = 0})async{

    if(pageNum == 0){
      emit(NewestBooksLoading());
    }else{
      emit(NewestBooksPaginationLoading());
    }
    var result = await fetchNewestBooksUseCase.call(pageNum);

    result.fold((failure) {
      if(pageNum == 0){
        emit(NewestBooksFailure(failure.message));
      }else{
        emit(NewestBooksPaginationFailure(failure.message));
      }
    }, (books){
      emit(NewestBooksSuccess(books));
    });
  }
}
