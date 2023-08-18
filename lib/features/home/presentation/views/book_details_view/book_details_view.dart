import 'package:flutter/material.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/views/book_details_view/widgets/book_details_view_body.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({Key? key, required this.book}) : super(key: key);

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WillPopScope(
          onWillPop: () async {
            Navigator.pop(context);
            return true;
          },
          child: BookDetailsViewBody(
            book: book,
          ),
        ),
      ),
    );
  }
}
