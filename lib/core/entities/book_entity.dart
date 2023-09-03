import 'package:hive/hive.dart';

part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity extends HiveObject {
  @HiveField(0)
  final String bookId;
  @HiveField(1)
  final String? imageUrl;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String? authorName;
  @HiveField(4)
  final String? price;
  @HiveField(5)
  final num? rating;
  @HiveField(6)
  final num? ratingsCount;
  @HiveField(7)
  final String? previewLink;

  BookEntity({
    required this.bookId,
    required this.imageUrl,
    required this.title,
    required this.authorName,
    required this.price,
    required this.rating,
    required this.ratingsCount,
    required this.previewLink,
  });
}
