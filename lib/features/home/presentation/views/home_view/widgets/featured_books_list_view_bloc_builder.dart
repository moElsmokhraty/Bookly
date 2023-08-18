import 'package:bookly/core/widgets/custom_error.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/home/presentation/views/home_view/widgets/featured_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/features/home/presentation/cubits/featured_books_cubit/featured_books_cubit.dart';

class FeaturedBooksListViewBLocBuilder extends StatelessWidget {
  const FeaturedBooksListViewBLocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FetchFeaturedBooksSuccess){
          return FeaturedBooksListView(books: state.books);
        } else if (state is FetchFeaturedBooksFailure){
          return Center(child: CustomError(errMessage: state.errMessage));
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
