import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_featured_books_use_case.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this._fetchUseCase) : super(FeaturedBooksInitial());

  final FetchFeaturedBooksUseCase _fetchUseCase;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    var result = await _fetchUseCase.call();
    result.fold((failure) {
      emit(FeaturedBooksFailure(failure.errMessage));
    }, (books) {
      emit(FeaturedBooksSuccess(books));
    });
  }
}
