import 'package:equatable/equatable.dart';

class BookEntity extends Equatable {
  final String bookId;
  final String? imageUrl;
  final String title;
  final String? authorName;
  final String? price;
  final num? rating;

  const BookEntity({
    required this.bookId,
    required this.imageUrl,
    required this.title,
    required this.authorName,
    required this.price,
    required this.rating,
  });

  @override
  List<Object?> get props {
    return [
      bookId,
      imageUrl,
      title,
      authorName,
      price,
      rating,
    ];
  }
}
