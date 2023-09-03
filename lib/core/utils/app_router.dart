import 'package:bookly/constants.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/core/entities/book_entity.dart';
import 'package:bookly/features/search/presentation/views/search_view.dart';
import 'package:bookly/features/splash/presentation/views/splash_view.dart';
import 'package:bookly/features/home/presentation/views/home_view/home_view.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_similar_books_use_case.dart';
import 'package:bookly/features/search/domain/use_cases/fetch_searched_books_use_case.dart';
import 'package:bookly/features/home/presentation/views/book_details_view/book_details_view.dart';
import 'package:bookly/features/home/presentation/cubits/similar_books_cubit/similar_book_cubit.dart';
import 'package:bookly/features/search/presentation/cubits/searched_books_cubit/searched_books_cubit.dart';

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
          create: (context) => SimilarBooksCubit(getIt.get<FetchSimilarBooksUseCase>())..fetchSimilarBooks(),
          child: BookDetailsView(
            book: state.extra as BookEntity,
          ),
        ),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => BlocProvider(
            create: (context) => SearchedBooksCubit(getIt.get<FetchSearchedBooksUseCase>()),
            child: const SearchView()),
      ),
    ],
  );
}
