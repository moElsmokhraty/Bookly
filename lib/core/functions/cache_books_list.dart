import 'package:hive/hive.dart';
import 'package:bookly/core/entities/book_entity.dart';

void cacheBooksList(List<BookEntity> books, String boxName) {
  var box = Hive.box<BookEntity>(boxName);
  box.addAll(books);
}