import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_raiting.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_action.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_details_list_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomBookDetailsAppBar(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.2,
                        ),
                        child: const CustomBookImage(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 43, bottom: 6),
                        child: Text(
                          "The Jungle Book",
                          style: Styles.textStyle30.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Opacity(
                        opacity: 0.7,
                        child: Text(
                          "Rudyard Kipling",
                          style: Styles.textStyle18.copyWith(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      const BookRating(
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                      const SizedBox(height: 37),
                      const BookAction(),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsGeometry.only(left: 16),
                child: Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Text(
                    "You can also like",
                    style: Styles.textStyle16.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const CustomBookDetialsListView(),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ],
    );
  }
}
