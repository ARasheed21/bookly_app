part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchSuccess extends SearchState {
  final List<BookEntity> books;
  SearchSuccess(this.books);
}

class SearchLoading extends SearchState {}

class SearchFailure extends SearchState {
  final String errMessage;
  SearchFailure(this.errMessage);
}
