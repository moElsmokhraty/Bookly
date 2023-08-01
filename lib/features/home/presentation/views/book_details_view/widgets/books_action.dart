import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/core/utils/url_launcher.dart';
import 'package:bookly/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({Key? key, required this.book}) : super(key: key);

  final BookModel book;

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
                topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
          )),
          Expanded(
              child: CustomButton(
            text: getText(book),
            function: () async {
              launchMyUrl(context, book.volumeInfo!.previewLink);
            },
            fontSize: 16,
            backGroundColor: const Color(0xffEF8262),
            textColor: Colors.white,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12)),
          )),
        ],
      ),
    );
  }

  String getText(BookModel book) {
    if (book.volumeInfo?.previewLink == null) {
      return 'Not Available';
    } else {
      return 'Free Preview';
    }
  }
}
