import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/core/entities/book_entity.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_featured_books_use_case.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this._fetchUseCase) : super(FeaturedBooksInitial());

  final FetchFeaturedBooksUseCase _fetchUseCase;

  Future<void> fetchFeaturedBooks({int page = 0}) async {
    if (page == 0) {
      emit(FetchFeaturedBooksLoading());
    } else {
      emit(FetchFeaturedBooksPaginationLoading());
    }
    var result = await _fetchUseCase.call(page: page);
    result.fold((failure) {
      if (page == 0) {
        emit(FetchFeaturedBooksFailure(failure.errMessage));
      } else {
        emit(FetchFeaturedBooksPaginationFailure(failure.errMessage));
      }
    }, (books) {
      emit(FetchFeaturedBooksSuccess(books));
    });
  }
}
