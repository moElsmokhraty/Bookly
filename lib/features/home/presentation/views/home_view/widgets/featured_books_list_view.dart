import 'package:bookly/constants.dart';
import 'package:bookly/core/widgets/custom_error.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/home/presentation/view_model/cubits/featured_books_cubit/featured_books_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'custom_book_image.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double listViewHeight = MediaQuery.of(context).size.height * 0.3;
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
        builder: (context, state) {
      if (state is FeaturedBooksSuccess) {
        return CarouselSlider.builder(
          itemBuilder: (context, index, realIndex) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GestureDetector(
                onTap: () {
                  GoRouter.of(context)
                      .push(kBookDetailsView, extra: state.books[index]);
                },
                child: CustomBookImage(
                    imageUrl: state.books[index].volumeInfo.imageLinks?.thumbnail ??
                        ''),
              ),
            );
          }, itemCount: state.books.length,
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

      } else if (state is FeaturedBooksFailure) {
        return Center(child: CustomError(errMessage: state.errMessage));
      } else {
        return const CustomLoadingIndicator();
      }
    });
  }
}
