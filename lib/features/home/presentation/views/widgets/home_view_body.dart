import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featured_book_list_view_bloc_consumer.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_books_list_view_bloc_consumber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final scrollController = ScrollController();
  bool isLoading = false;
  var nextPage = 1;
  
  @override
  void initState() {
    super.initState();
    scrollController.addListener(onScroll);
  }

  void onScroll () {
    if (isBottom && !isLoading) {
      loadMoreBooks();
    }
  }

  bool get isBottom {
    if (!scrollController.hasClients) return false;
    final maxScroll = scrollController.position.maxScrollExtent;
    final currScroll = scrollController.offset;
    return currScroll >= (maxScroll * 0.7);
  }

  Future<void> loadMoreBooks () async {
    if (isLoading) return;
    setState(() {
      isLoading = true;
    });
    try {
      await BlocProvider.of<NewestBooksCubit>(context).fetchNewestBooks(pageNumber: nextPage);
      if (mounted) nextPage++;
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    scrollController.removeListener(onScroll);
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(child: CustomAppBar()),
        SliverToBoxAdapter(child: FeaturedBooksListViewBlocConsumer()),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 20, top: 36, bottom: 20),
            child: Text("Newest Books", style: Styles.textStyle18),
          ),
        ),
        SliverToBoxAdapter(child: NewestBooksListViewBlocBuilder()),
      ],
    );
  }
}




