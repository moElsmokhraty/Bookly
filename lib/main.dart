import 'dart:io';
import 'package:flutter/material.dart';
import 'package:bookly/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:bookly/bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'core/functions/set_system_ui_overlay_style.dart';
import 'package:bookly/core/functions/setup_hive_db.dart';
import 'features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly/features/home/presentation/cubits/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/features/home/presentation/cubits/featured_books_cubit/featured_books_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setSystemUIOverlayStyle();
  await setupHiveDB();
  setupServiceLocator();
  Bloc.observer = MyBlocObserver();
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FeaturedBooksCubit(getIt.get<FetchFeaturedBooksUseCase>())..fetchFeaturedBooks()),
        BlocProvider(create: (context) => NewestBooksCubit(getIt.get<FetchNewestBooksUseCase>())..fetchNewestBooks()),
      ],
      child: Platform.isAndroid
          ? MaterialApp.router(
              routerConfig: AppRouter.router,
              debugShowCheckedModeBanner: false,
              theme: ThemeData.dark().copyWith(
                useMaterial3: true,
                scaffoldBackgroundColor: kPrimaryColor,
                textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
              ),
            )
          : CupertinoApp.router(
              routerConfig: AppRouter.router,
              debugShowCheckedModeBanner: false,
              theme: CupertinoThemeData(
                primaryColor: kPrimaryColor,
                scaffoldBackgroundColor: kPrimaryColor,
                textTheme: CupertinoTextThemeData(
                  textStyle: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme).bodyLarge,
                ),
              ),
            ),
    );
  }
}
