import 'package:bookly/core/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks({int page = 0});

  List<BookEntity> fetchNewestBooks();

  List<BookEntity> fetchSimilarBooks();
}
