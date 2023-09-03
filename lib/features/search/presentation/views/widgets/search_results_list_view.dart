import 'package:bookly/core/widgets/custom_error.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/home/presentation/views/home_view/widgets/book_list_view_item.dart';
import 'package:bookly/features/search/presentation/cubits/searched_books_cubit/searched_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchResultListView extends StatefulWidget {
  const SearchResultListView({Key? key}) : super(key: key);

  @override
  State<SearchResultListView> createState() => _SearchResultListViewState();
}

class _SearchResultListViewState extends State<SearchResultListView> {
  int nextPage = 1;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_checkScrollThreshold);
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
    final double scrollThreshold = maxScroll * 0.7;
    SearchedBooksCubit cubit = BlocProvider.of<SearchedBooksCubit>(context);
    if (currentPosition >= scrollThreshold) {
      cubit.fetchSearchedBooks(query: cubit.searchController.text, page: nextPage++);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchedBooksCubit, SearchedBooksState>(
      builder: (context, state) {
        if (state is SearchedBooksSuccess) {
          return ListView.builder(
            controller: _scrollController,
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
      },
    );
  }
}
