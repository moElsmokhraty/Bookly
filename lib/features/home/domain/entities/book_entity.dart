class BookEntity {
  final String bookId;
  final String? imageUrl;
  final String title;
  final String? authorName;
  final String? price;
  final num? rating;

  BookEntity({
    required this.bookId,
    required this.imageUrl,
    required this.title,
    required this.authorName,
    required this.price,
    required this.rating,
  });
}
