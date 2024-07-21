import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../domain/entities/book_entity.dart';
import '../../../domain/use_cases/fetach_newest_books_usecase.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  final FetchNewestdBooksUseCase fetchNewestdBooksUseCase;
  FeaturedBooksCubit(this.fetchNewestdBooksUseCase) : super(FeaturedBooksInitial());

  fetchFeaturedBook ()async{
    emit(FeaturedBooksLoading());
    var result = await fetchNewestdBooksUseCase.call();

    result.fold((failure) {
      emit(FeaturedBooksFailure(failure.message));
    }, (books){
      emit(FeaturedBooksSuccess(books));
    });
  }
}
