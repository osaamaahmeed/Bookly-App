import 'package:bookly_app/core/utils/functions/lauch_url.dart';
import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

class BookAction extends StatelessWidget {
  const BookAction({super.key, required this.bookEntity});
  final BookEntity bookEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: CustomButton(
            text: 'Free',
            backgroundColor: Colors.white,
            textColor: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
          ),
        ),
        Expanded(
          child: CustomButton(
            onPressed: () async {
              launchCustomUrl(context, 'bookEntity.volumeInfo.previewLink');
            },
            backgroundColor: const Color(0xffEF8262),
            textColor: Colors.white,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            text: getText(bookEntity),
          ),
        ),
      ],
    );
  }

  String getText(BookEntity bookEntity) {
    // if (BookEntity.volumeInfo.previewLink == null) {
      // return 'Not Availabe';
    // } else {
      // return 'Preview';
    // }
    return 'preview';
  }
}
