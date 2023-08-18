import 'custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:bookly/constants.dart';
import 'package:go_router/go_router.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({Key? key, required this.books}) : super(key: key);

  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    double listViewHeight = MediaQuery.of(context).size.height * 0.3;
    return CarouselSlider.builder(
      itemBuilder: (context, index, realIndex) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: GestureDetector(
            onTap: () {
              GoRouter.of(context).push(kBookDetailsView, extra: books[index]);
            },
            child: CustomBookImage(imageUrl: books[index].imageUrl!),
          ),
        );
      },
      itemCount: books.length,
      options: CarouselOptions(
        viewportFraction: 0.44,
        initialPage: 0,
        height: listViewHeight,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.ease,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
      ),
    );
  }
}
