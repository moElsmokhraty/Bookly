part of 'searched_books_cubit.dart';

@immutable
abstract class SearchedBooksState {}

class SearchedBooksInitial extends SearchedBooksState {}

class SearchedBooksSuccess extends SearchedBooksState {
  final List<BookModel> books;
  SearchedBooksSuccess(this.books);
}

class SearchedBooksFailure extends SearchedBooksState {
  final String errMessage;
  SearchedBooksFailure(this.errMessage);
}

class SearchedBooksLoading extends SearchedBooksState {}
