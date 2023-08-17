import 'package:dartz/dartz.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/use_cases/no_param_use_case.dart';
import 'package:bookly/features/home/domain/repos/home_repo.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';

class FetchNewestBooksUseCase extends UseCase<List<BookEntity>> {
  final HomeRepo _homeRepo;

  FetchNewestBooksUseCase(this._homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call() async {
    return await _homeRepo.fetchNewestBooks();
  }
}
