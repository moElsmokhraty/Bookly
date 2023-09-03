import 'package:bookly/core/use_cases/no_param_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/entities/book_entity.dart';
import 'package:bookly/features/search/domain/repos/search_repo.dart';

class FetchSearchedBooksUseCase extends UseCase<List<BookEntity>> {
  final SearchRepo _searchRepo;

  FetchSearchedBooksUseCase(this._searchRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call({
    String query = '',
    int page = 0,
  }) async {
    return await _searchRepo.fetchSearchedBooks(query: query, page: page);
  }
}
