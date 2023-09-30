import 'package:flutter/material.dart';
import 'package:bookly/core/utils/url_launcher.dart';
import 'package:bookly/core/entities/book_entity.dart';
import 'package:bookly/core/widgets/custom_button.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({Key? key, required this.book}) : super(key: key);

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          const Expanded(
            child: CustomButton(
              text: 'Free',
              backGroundColor: Colors.white,
              textColor: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
          ),
          Expanded(
            child: CustomButton(
              text: book.previewLink == null ? 'Not Available' : 'Free Preview',
              onPressed: () async {
                if (book.previewLink != null) {
                  await launchMyUrl(context, book.previewLink);
                }
              },
              fontSize: 16,
              backGroundColor: const Color(0xffEF8262),
              textColor: Colors.white,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
