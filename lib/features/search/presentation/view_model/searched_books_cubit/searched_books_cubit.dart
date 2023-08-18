import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/search/data/repos/search_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'searched_books_state.dart';

class SearchedBooksCubit extends Cubit<SearchedBooksState> {
  SearchedBooksCubit(this._searchRepoImpl) : super(SearchedBooksInitial());

  final SearchRepoImpl _searchRepoImpl;

  Future<void> fetchSearchedBooks({required String query})async {
    emit(SearchedBooksLoading());
    var result = await _searchRepoImpl.fetchSearchedBooks(query: query);
    result.fold((failure) {
      emit(SearchedBooksFailure(failure.errMessage));
    }, (books){
      emit(SearchedBooksSuccess(books));
    });
  }
}
