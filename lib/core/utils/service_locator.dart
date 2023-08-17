import 'package:bookly/features/search/data/repos/search_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'api_service.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(getIt.get<ApiService>()),
  );
  // getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
  //   getIt.get<ApiService>(),
  // ));
}
