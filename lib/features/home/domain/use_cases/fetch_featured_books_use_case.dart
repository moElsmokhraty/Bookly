import 'package:bookly/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/use_cases/no_param_use_case.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>> {
  final HomeRepo _homeRepo;

  FetchFeaturedBooksUseCase(this._homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call({int page = 0}) async {
    return await _homeRepo.fetchFeaturedBooks(page: page);
  }
}
