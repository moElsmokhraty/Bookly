import 'package:dartz/dartz.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/use_cases/no_param_use_case.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo/home_repo.dart';

class FetchNewestBooksUseCase extends UseCase<List<BookModel>> {
  final HomeRepo _homeRepo;

  FetchNewestBooksUseCase(this._homeRepo);

  @override
  Future<Either<Failure, List<BookModel>>> call() async {
    return await _homeRepo.fetchNewestBooks();
  }
}