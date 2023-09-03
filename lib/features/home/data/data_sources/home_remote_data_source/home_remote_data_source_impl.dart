import 'package:bookly/constants.dart';
import 'home_remote_data_source.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/core/functions/get_books_list.dart';
import 'package:bookly/core/functions/cache_books_list.dart';
import 'package:bookly/core/entities/book_entity.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService _apiService;

  HomeRemoteDataSourceImpl(this._apiService);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int page = 0}) async {
    var data = await _apiService.get(
        endpoint:
            'volumes?Filtering=free-ebooks&q=subject:Programming&startIndex=${page * 10}');
    List<BookEntity> books = getBooksList(data);
    cacheBooksList(books, kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await _apiService.get(
        endpoint:
            'volumes?Filtering=free-ebooks&Sorting=newest&q=subject:Programming');
    List<BookEntity> books = getBooksList(data);
    cacheBooksList(books, kNewestBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchSimilarBooks() async {
    var data = await _apiService.get(
        endpoint:
            'volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:Programming');
    List<BookEntity> books = getBooksList(data);
    cacheBooksList(books, kSimilarBox);
    return books;
  }
}
