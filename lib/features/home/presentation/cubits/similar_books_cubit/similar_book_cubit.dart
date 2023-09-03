import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/core/entities/book_entity.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_similar_books_use_case.dart';

part 'similar_book_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this._fetchUseCase) : super(SimilarBooksInitial());

  final FetchSimilarBooksUseCase _fetchUseCase;

  Future<void> fetchSimilarBooks() async {
    emit(SimilarBooksLoading());
    var result = await _fetchUseCase.call();
    result.fold((failure) {
      emit(SimilarBooksFailure(failure.errMessage));
    }, (books) {
      emit(SimilarBooksSuccess(books));
    });
  }
}
