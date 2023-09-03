import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/core/errors/server_failure.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/search/domain/repos/search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService _apiService;

  SearchRepoImpl(this._apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchedBooks({
    required String query,
    required int page,
  }) async {
    try {
      var data = await _apiService.get(
          endpoint: 'volumes?Filtering=free-ebooks&q=$query&startIndex=${page * 10}');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return Right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(errMessage: e.toString()));
      }
    }
  }
}
