import 'package:bookly/constants.dart';
import 'package:bookly/core/widgets/custom_error.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/home/presentation/cubits/similar_books_cubit/similar_book_cubit.dart';
import 'package:bookly/features/home/presentation/views/home_view/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.2;
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
        builder: (context, state) {
      if (state is SimilarBooksSuccess) {
        return SizedBox(
          height: height,
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: GestureDetector(
                    onTap: (){
                      GoRouter.of(context).push(kBookDetailsView, extra: state.books[index]);
                    },
                    child: CustomBookImage(
                      imageUrl:
                          state.books[index].imageUrl ??
                              '',
                    ),
                  ),
                );
              }),
        );
      } else if (state is SimilarBooksFailure) {
        return CustomError(errMessage: state.errMessage);
      } else {
        return const CustomLoadingIndicator();
      }
    });
  }
}
