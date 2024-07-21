import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:udemy8_bookly/features/home/domain/use_cases/fetch_featured_books_usecase.dart';
import '../../../domain/entities/book_entity.dart';
part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  final FetchFeaturedBooksUseCase fetchFeaturedBooksUseCase;
  FeaturedBooksCubit(this.fetchFeaturedBooksUseCase) : super(FeaturedBooksInitial());

  Future <void> fetchFeaturedBook ({int pageNum = 0})async{
    if(pageNum == 0){
      emit(FeaturedBooksLoading());
    }else{
      emit(FeaturedBooksPaginationLoading());
    }
    var result = await fetchFeaturedBooksUseCase.call(pageNum);

    result.fold((failure) {
      emit(FeaturedBooksFailure(failure.message));
    }, (books){
      emit(FeaturedBooksSuccess(books));
    });
  }
}
