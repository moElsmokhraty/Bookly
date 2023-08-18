import 'book_rating.dart';
import 'package:bookly/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/views/home_view/widgets/custom_book_image.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({Key? key, required this.book}) : super(key: key);

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    double bookDetailsWidth = MediaQuery.of(context).size.width * 0.5;
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(kBookDetailsView, extra: book);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            CustomBookImage(
              imageUrl: book.imageUrl ?? '',
            ),
            const SizedBox(width: 15.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: bookDetailsWidth,
                      child: Text(
                        book.title,
                        style: Styles.textStyle20
                            .copyWith(fontFamily: kGtSectraFine),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )),
                  const SizedBox(height: 3.0),
                  Text(book.authorName ?? 'Unknown',
                      style: Styles.textStyle14
                          .copyWith(fontWeight: FontWeight.w500)),
                  const SizedBox(height: 3.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Free',
                          style: Styles.textStyle20
                              .copyWith(fontWeight: FontWeight.bold)),
                      BookRating(
                        rating: book.rating ?? 'Not Rated',
                        ratesCount: book.ratingsCount ?? 0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
