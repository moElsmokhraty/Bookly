import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/models/book_model/book_model/book_model.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService _apiService;

  SearchRepoImpl(this._apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchedBooks(
      {required String query}) async {
    // TODO: implement fetchSearchedBooks
    try {
      var data = await _apiService.get(endpoint: 'volumes?Filtering=free-ebooks&q=$query');
      List<BookModel> books = [];
      for (var item in data['items']){
        books.add(BookModel.fromJson(item));
      }
      return Right(books);
    } on Exception catch (e){
      if (e is DioError){
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(errMessage: e.toString()));
      }
    }
  }

}