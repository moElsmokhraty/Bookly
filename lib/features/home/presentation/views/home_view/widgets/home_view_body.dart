import 'home_view_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/home_view/widgets/newest_books_list_view_bloc_builder.dart';
import 'package:bookly/features/home/presentation/views/home_view/widgets/featured_books_list_view_bloc_consumer.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter (
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: HomeViewAppBar(),
              ),
              FeaturedBooksListViewBLocConsumer(),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text('Newest Books', style: Styles.textStyle18),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: NewestBooksListViewBlocBuilder(),
          ),
        ),
      ],
    );
  }
}
