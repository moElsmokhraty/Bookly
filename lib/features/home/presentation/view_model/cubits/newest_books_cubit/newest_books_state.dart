part of 'newest_books_cubit.dart';

@immutable
abstract class NewestBookState {}

class NewestBooksInitial extends NewestBookState {}

class NewestBooksLoading extends NewestBookState {}

class NewestBooksSuccess extends NewestBookState {
  final List<BookModel> books;

  NewestBooksSuccess(this.books);
}

class NewestBooksFailure extends NewestBookState {
  final String errMessage;

  NewestBooksFailure(this.errMessage);
}
