import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_detials_section.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_detials_list_view_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookEntity});
  final BookEntity bookEntity;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: BookDetialsSection(bookEntity: bookEntity),
              ),
              const Expanded(child: SizedBox(height: 50)),
              const CustomBookDetialsListViewSection(),
            ],
          ),
        ),
      ],
    );
  }
}
