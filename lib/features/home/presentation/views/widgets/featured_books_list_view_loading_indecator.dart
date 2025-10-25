import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image_loading_indecator.dart';
import 'package:flutter/widgets.dart';

class FeaturedBooksListViewLoadingIndecator extends StatelessWidget {
  const FeaturedBooksListViewLoadingIndecator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 12),
        // physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        // itemCount: widget.books.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CustomBookImageLoadingIndecator(),
          );
        },
      ),
    );
  }
}