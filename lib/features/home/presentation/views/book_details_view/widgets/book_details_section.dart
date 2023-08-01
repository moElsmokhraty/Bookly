import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/home_view/widgets/book_rating.dart';
import 'package:bookly/features/home/presentation/views/home_view/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

import 'books_action.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({Key? key, required this.book}) : super(key: key);

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    double bookImagePadding = MediaQuery.of(context).size.width * 0.2;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: bookImagePadding,
          ),
          child: Center(
            child: CustomBookImage(
              imageUrl: book.volumeInfo?.imageLinks?.thumbnail ?? '',
            ),
          ),
        ),
        const SizedBox(height: 30),
        Text(
          book.volumeInfo!.title!,
          style: Styles.textStyle30,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 6),
        Opacity(
          opacity: 0.7,
          child: Text(
            book.volumeInfo!.authors?.first ?? '',
            style: Styles.textStyle18.copyWith(
                fontWeight: FontWeight.w500, fontStyle: FontStyle.italic),
          ),
        ),
        const SizedBox(height: 18),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          rating: book.volumeInfo!.averageRating ?? 'Not Rated',
          ratesCount: book.volumeInfo!.ratingsCount ?? 0,
        ),
        const SizedBox(
          height: 30,
        ),
        BooksAction(
          book: book,
        ),
      ],
    );
  }
}
