import 'api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/features/search/data/repos/search_repo_impl.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_similar_books_use_case.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly/features/home/data/data_sources/home_local_data_source/home_local_data_source_impl.dart';
import 'package:bookly/features/home/data/data_sources/home_remote_data_source/home_remote_data_source_impl.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRemoteDataSourceImpl>(HomeRemoteDataSourceImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
    homeRemoteDataSource: getIt.get<HomeRemoteDataSourceImpl>(),
    homeLocalDataSource: HomeLocalDataSourceImpl(),
  ));
  getIt.registerSingleton<FetchFeaturedBooksUseCase>(FetchFeaturedBooksUseCase(
    getIt.get<HomeRepoImpl>(),
  ));
  getIt.registerSingleton<FetchNewestBooksUseCase>(FetchNewestBooksUseCase(
    getIt.get<HomeRepoImpl>(),
  ));
  getIt.registerSingleton<FetchSimilarBooksUseCase>(FetchSimilarBooksUseCase(
    getIt.get<HomeRepoImpl>(),
  ));

  getIt.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(getIt.get<ApiService>()),
  );
}
