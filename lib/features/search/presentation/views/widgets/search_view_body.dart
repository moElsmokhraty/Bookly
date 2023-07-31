import 'package:flutter/material.dart';
import 'custom_search_text_field.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_results_list_view.dart';


class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.0),
                CustomSearchTextField(),
                SizedBox(height: 20.0),
                Text('Search Results', style: Styles.textStyle18),
                SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
        SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: SearchResultListView(),
          ),
        ),
      ], // slivers
    );
  }
}
