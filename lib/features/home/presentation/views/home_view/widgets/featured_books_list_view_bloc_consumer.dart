import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/core/entities/book_entity.dart';
import 'package:bookly/core/widgets/custom_error.dart';
import 'featured_books_list_view_loading_indicator.dart';
import 'package:bookly/core/functions/show_custom_snack_bar.dart';
import 'package:bookly/features/home/presentation/views/home_view/widgets/featured_books_list_view.dart';
import 'package:bookly/features/home/presentation/cubits/featured_books_cubit/featured_books_cubit.dart';

class FeaturedBooksListViewBLocConsumer extends StatelessWidget {
  const FeaturedBooksListViewBLocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    List<BookEntity> books = [];
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FetchFeaturedBooksSuccess) {
          books.addAll(state.books);
        } else if (state is FetchFeaturedBooksPaginationFailure) {
          showCustomSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is FetchFeaturedBooksSuccess ||
            state is FetchFeaturedBooksPaginationLoading ||
            state is FetchFeaturedBooksPaginationFailure) {
          return FeaturedBooksListView(books: books);
        } else if (state is FetchFeaturedBooksFailure) {
          return Center(child: CustomError(errMessage: state.errMessage));
        } else {
          return const FeaturedBooksListViewLoadingIndicator();
        }
      },
    );
  }
}
