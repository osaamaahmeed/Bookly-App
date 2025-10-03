import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_details_list_view.dart';
import 'package:flutter/material.dart';

class CustomBookDetialsListViewSection extends StatelessWidget {
  const CustomBookDetialsListViewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsGeometry.only(left: 16),
          child: Text(
            "You can also like",
            style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w900),
          ),
        ),
        const SizedBox(height: 16),
        const CustomBookDetialsListView(),
        const SizedBox(height: 25),
      ],
    );
  }
}
