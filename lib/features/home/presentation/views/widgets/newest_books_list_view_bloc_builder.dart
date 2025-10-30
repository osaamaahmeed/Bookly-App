import 'package:bookly_app/core/widgets/custom_error.dart';
// import 'package:bookly_app/core/widgets/custom_loading_indecator.dart';
import 'package:bookly_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_books_list_view.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListViewBlocBuilder extends StatelessWidget {
  const NewestBooksListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (BuildContext context, state) {
        if (state is NewestBooksSuccess) {
          return NewestBooksListView(books: state.books, showBottomLoader: false,);
        } else if (state is NewestBooksPaggingLoading) {
          return NewestBooksListView(books: state.books, showBottomLoader: true);
        }
        else if (state is NewestBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return NewestBooksListView(books: [], showBottomLoader: true);
        }
      },
    );
  }
}
