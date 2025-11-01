import 'package:bookly_app/core/widgets/custom_loading_indecator.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:flutter/material.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({
    super.key,
    required this.books,
    required this.showBottomLoader,
    required this.loading,
  });
  final List<BookEntity> books;
  final bool showBottomLoader;
  final bool loading;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        if (index >= books.length) {
          return const CustomLoadingIndecator();
        }
        return Padding(
          key: ValueKey('${books[index].bookId}_$index'),
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: BookListViewItem(bookEntity: books[index]),
        );
      },
      itemCount: loading ? books.length + 1 : books.length,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      cacheExtent: 200,
    );
  }
}
