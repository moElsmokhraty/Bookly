import 'package:bookly/core/widgets/custom_error.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/home/presentation/views/home_view/widgets/book_list_view_item.dart';
import 'package:bookly/features/search/presentation/view_model/searched_books_cubit/searched_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchedBooksCubit, SearchedBooksState>(
        builder: (context, state) {
      if (state is SearchedBooksSuccess) {
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: state.books.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: BookListViewItem(
                book: state.books[index],
              ),
            );
          },
        );
      } else if (state is SearchedBooksInitial) {
        return const Center(
          child: Icon(
            FontAwesomeIcons.magnifyingGlass,
            size: 25,
          ),
        );
      } else if (state is SearchedBooksFailure) {
        return CustomError(errMessage: state.errMessage);
      } else {
        return const CustomLoadingIndicator();
      }
    });
  }
}
