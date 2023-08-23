import 'package:bookly/features/home/domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks({int page = 0});

  List<BookEntity> fetchNewestBooks();

  List<BookEntity> fetchSimilarBooks();
}
