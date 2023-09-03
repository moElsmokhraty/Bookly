part of 'featured_books_cubit.dart';

@immutable
abstract class FeaturedBooksState {}

class FeaturedBooksInitial extends FeaturedBooksState {}

class FetchFeaturedBooksLoading extends FeaturedBooksState {}

class FetchFeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookEntity> books;

  FetchFeaturedBooksSuccess(this.books);
}

class FetchFeaturedBooksFailure extends FeaturedBooksState {
  final String errMessage;

  FetchFeaturedBooksFailure(this.errMessage);
}

class FetchFeaturedBooksPaginationLoading extends FeaturedBooksState {}

class FetchFeaturedBooksPaginationSuccess extends FeaturedBooksState {
  final List<BookEntity> books;

  FetchFeaturedBooksPaginationSuccess(this.books);
}

class FetchFeaturedBooksPaginationFailure extends FeaturedBooksState {
  final String errMessage;

  FetchFeaturedBooksPaginationFailure(this.errMessage);
}
