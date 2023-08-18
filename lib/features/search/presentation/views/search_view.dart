import 'package:flutter/material.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          Navigator.pop(context);
          return true;
        },
        child: const Scaffold(
          body: SearchViewBody(),
        ),
      ),
    );
  }
}
