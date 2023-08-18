part of 'newest_books_cubit.dart';

@immutable
abstract class NewestBookState {}

class NewestBooksInitial extends NewestBookState {}

class FetchNewestBooksLoading extends NewestBookState {}

class FetchNewestBooksSuccess extends NewestBookState {
  final List<BookEntity> books;

  FetchNewestBooksSuccess(this.books);
}

class FetchNewestBooksFailure extends NewestBookState {
  final String errMessage;

  FetchNewestBooksFailure(this.errMessage);
}
