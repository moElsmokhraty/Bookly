import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/core/entities/book_entity.dart';
import 'package:bookly/features/search/domain/use_cases/fetch_searched_books_use_case.dart';

part 'searched_books_state.dart';

class SearchedBooksCubit extends Cubit<SearchedBooksState> {
  SearchedBooksCubit(this._useCase) : super(SearchedBooksInitial());

  final FetchSearchedBooksUseCase _useCase;

  TextEditingController searchController = TextEditingController();

  Future<void> fetchSearchedBooks({required String query, required int page})async {
    emit(SearchedBooksLoading());
    var result = await _useCase.call(query: query, page: page);
    result.fold((failure) {
      emit(SearchedBooksFailure(failure.errMessage));
    }, (books){
      emit(SearchedBooksSuccess(books));
    });
  }
}
