import 'package:bookly_app/core/widgets/custom_error.dart';
import 'package:bookly_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListViewBlocBuilder extends StatefulWidget {
  const NewestBooksListViewBlocBuilder({super.key});

  @override
  State<NewestBooksListViewBlocBuilder> createState() =>
      _NewestBooksListViewBlocBuilderState();
}

class _NewestBooksListViewBlocBuilderState
    extends State<NewestBooksListViewBlocBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
      builder: (BuildContext context, state) {
        if (state is NewestBooksSuccess) {
          return NewestBooksListView(
            books: state.books,
            showBottomLoader: false,
            loading: false,
          );
        } else if (state is NewestBooksPaggingLoading) {
          return NewestBooksListView(
            books: state.books,
            showBottomLoader: false,
            loading: true,
          );
        } else if (state is NewestBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else if (state is NewestBooksPaggingFailure) {
          final cubit = BlocProvider.of<NewestBooksCubit>(context);
          return NewestBooksListView(
            books: List.from(cubit.allBooks),
            showBottomLoader: false,
            loading: false,
          );
        } else {
          return NewestBooksListView(
            books: [],
            showBottomLoader: false,
            loading: false,
          );
        }
      },
      listener: (BuildContext context, NewestBooksState state) {
        if (state is NewestBooksFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errMessage)));
        } else if (state is NewestBooksPaggingFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
    );
  }
}
