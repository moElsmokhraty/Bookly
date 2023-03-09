import 'package:bookly/constants.dart';
import 'package:bookly/core/models/book_model/book_model/book_model.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/home/data/repos/home_repo/home_repo_impl.dart';
import 'package:bookly/features/home/presentation/view_model/cubits/similar_books_cubit/similar_book_cubit.dart';
import 'package:bookly/features/home/presentation/views/book_details_view/book_details_view.dart';
import 'package:bookly/features/home/presentation/views/home_view/home_view.dart';
import 'package:bookly/features/search/data/repos/search_repo_impl.dart';
import 'package:bookly/features/search/presentation/view_model/searched_books_cubit/searched_books_cubit.dart';
import 'package:bookly/features/search/presentation/views/search_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kSplashView,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
            create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
            child: BookDetailsView(
              book: state.extra as BookModel,
            )),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => BlocProvider(
          create: (context) => SearchedBooksCubit(getIt.get<SearchRepoImpl>()),
            child: const SearchView()),
      ),
    ],
  );
}
