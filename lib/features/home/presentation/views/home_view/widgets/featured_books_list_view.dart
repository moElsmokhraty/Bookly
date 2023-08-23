import 'package:bookly/constants.dart';
import 'package:go_router/go_router.dart';

import 'custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/cubits/featured_books_cubit/featured_books_cubit.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({Key? key, required this.books})
      : super(key: key);

  final List<BookEntity> books;

  @override
  FeaturedBooksListViewState createState() => FeaturedBooksListViewState();
}

class FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  int nextPage = 1;
  final double scrollThresholdPercentage = 0.7;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_checkScrollThreshold);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_checkScrollThreshold);
    _scrollController.dispose();
    super.dispose();
  }

  void _checkScrollThreshold() {
    final double currentPosition = _scrollController.position.pixels;
    final double maxScroll = _scrollController.position.maxScrollExtent;
    final double scrollThreshold = maxScroll * scrollThresholdPercentage;
    if (currentPosition >= scrollThreshold) {
      BlocProvider.of<FeaturedBooksCubit>(context).fetchFeaturedBooks(
        page: nextPage++,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final listViewHeight = MediaQuery.of(context).size.height * 0.3;
    return SizedBox(
      height: listViewHeight,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: widget.books.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CustomBookImage(
              book: widget.books[index],
              onTap: () {
                GoRouter.of(context)
                    .pushReplacement(kBookDetailsView, extra: widget.books[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
