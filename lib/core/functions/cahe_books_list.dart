import 'package:hive/hive.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';

void cacheBooksList(List<BookEntity> books, String boxName) {
  var box = Hive.box(boxName);
  box.addAll(books);
}