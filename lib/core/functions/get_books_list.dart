import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/core/entities/book_entity.dart';

List<BookEntity> getBooksList(Map<String, dynamic> data) {
  List<BookEntity> books = [];
  for (var item in data['items']) {
    books.add(BookModel.fromJson(item));
  }
  return books;
}
