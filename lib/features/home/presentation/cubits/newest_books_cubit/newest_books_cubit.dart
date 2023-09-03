import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:bookly/core/entities/book_entity.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_newest_books_use_case.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBookState> {
  NewestBooksCubit(this._fetchUseCase) : super(NewestBooksInitial());

  final FetchNewestBooksUseCase _fetchUseCase;

  Future<void> fetchNewestBooks() async {
    emit(FetchNewestBooksLoading());
    var result = await _fetchUseCase.call();
    result.fold((failure) {
      emit(FetchNewestBooksFailure(failure.errMessage));
    }, (books) {
      emit(FetchNewestBooksSuccess(books));
    });
  }
}
