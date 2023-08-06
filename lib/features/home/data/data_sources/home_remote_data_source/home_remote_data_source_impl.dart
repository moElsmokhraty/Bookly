import 'home_remote_data_source.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/core/functions/get_books_list.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService _apiService;

  HomeRemoteDataSourceImpl(this._apiService);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await _apiService.get(
        endpoint: 'volumes?Filtering=free-ebooks&q=subject:Programming');
    List<BookEntity> books = getBooksList(data);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await _apiService.get(
        endpoint:
            'volumes?Filtering=free-ebooks&Sorting=newest&q=subject:computer-science');
    List<BookEntity> books = getBooksList(data);
    return books;
  }
}
