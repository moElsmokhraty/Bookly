import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/data/repos/home_repo_impl.dart';

part 'similar_book_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this._homeRepoImpl) : super(SimilarBooksInitial());

  final HomeRepoImpl _homeRepoImpl;

  // Future<void> fetchSimilarBooks({required String category}) async {
  //   emit(SimilarBooksLoading());
  //   var result = await _homeRepoImpl.fetchSimilarBooks(category: category);
  //   result.fold((failure) {
  //     emit(SimilarBooksFailure(failure.errMessage));
  //   }, (books) {
  //     emit(SimilarBooksSuccess(books));
  //   });
  // }
}
