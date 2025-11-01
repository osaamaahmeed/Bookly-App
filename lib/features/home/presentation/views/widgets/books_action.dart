import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/views/book_preview_view.dart';
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
              final previewLink = bookEntity.previewLink;
              
              if (previewLink == null || previewLink.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Unavailable to preview'),
                    backgroundColor: Colors.red,
                  ),
                );
                return;
              }

              // Validate URL format
              try {
                final uri = Uri.parse(previewLink);
                if (!uri.hasScheme || (!uri.scheme.startsWith('http'))) {
                  throw FormatException('Invalid URL');
                }
                
                // Navigate to preview view
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookPreviewView(url: previewLink),
                  ),
                );
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Unavailable link'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
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
    if (bookEntity.previewLink == null || bookEntity.previewLink!.isEmpty) {
      return 'preview';
    }
    return 'preview';
  }
}
