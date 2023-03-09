import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/book_details_view/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('You can also like',
            style: Styles.textStyle14
                .copyWith(fontWeight: FontWeight.w600, color: Colors.white)),
        const SizedBox(
          height: 20,
        ),
        const SimilarBooksListView(),
      ],
    );
  }
}
