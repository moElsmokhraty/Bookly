import 'home_local_data_source.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';

class HomeLocalDataSourceImpl implements HomeLocalDataSource {

  @override
  List<BookEntity> fetchFeaturedBooks() {
    throw UnimplementedError();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    throw UnimplementedError();
  }
}
