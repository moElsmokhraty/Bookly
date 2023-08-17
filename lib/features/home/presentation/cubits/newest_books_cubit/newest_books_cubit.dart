import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBookState> {
  NewestBooksCubit(this._homeRepoImpl) : super(NewestBooksInitial());

  final HomeRepoImpl _homeRepoImpl;

  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await _homeRepoImpl.fetchFeaturedBooks();
    result.fold((failure) {
      emit(NewestBooksFailure(failure.errMessage));
    }, (books) {
      emit(NewestBooksSuccess(books));
    });
  }
}
