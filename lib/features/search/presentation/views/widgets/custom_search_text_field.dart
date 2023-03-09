import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/search/presentation/view_model/searched_books_cubit/searched_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        onSubmitted: (String query){
          BlocProvider.of<SearchedBooksCubit>(context).fetchSearchedBooks(query: query);
        },
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: Styles.textStyle18,
          suffixIcon: const Opacity(
            opacity: 0.5,
            child: Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 22,
            ),
          ),
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          border: outlineInputBorder,
        ),
      );
  }
}

OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: const BorderSide(
    color: Color(0xff707070),
  ),
);
