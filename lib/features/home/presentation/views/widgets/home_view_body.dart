import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featured_book_list_view_bloc_consumer.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_books_list_view_bloc_builder.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              CustomAppBar(),
              FeaturedBooksListViewBlocConsumer(),
              Padding(
                padding: EdgeInsets.only(left: 20, top: 36, bottom: 20),
                child: Text("Newest Books", style: Styles.textStyle18),
              ),
            ],
          ),
        ),
        SliverFillRemaining(child: NewestBooksListViewBlocBuilder()),
      ],
    );
  }
}




