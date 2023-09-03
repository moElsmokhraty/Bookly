import 'package:bookly/core/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int page = 0});

  Future<List<BookEntity>> fetchNewestBooks();

  Future<List<BookEntity>> fetchSimilarBooks();
}