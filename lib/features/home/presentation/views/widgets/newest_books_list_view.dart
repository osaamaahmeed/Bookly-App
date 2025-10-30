import 'package:bookly_app/core/widgets/custom_loading_indecator.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:flutter/material.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({
    super.key,
    required this.books,
    required this.showBottomLoader,
  });
  final List<BookEntity> books;
  final bool showBottomLoader;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // controller: scrollController,
      itemBuilder: (context, index) {
        if (index < books.length) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: BookListViewItem(bookEntity: books[index]),
          );
        } else {
          return Padding(
            padding: EdgeInsetsGeometry.symmetric(vertical: 16),
            child: Center(child: CustomLoadingIndecator()),
          );
        }
      },
      itemCount: showBottomLoader ? books.length+1 : books.length,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
    );
  }
}
