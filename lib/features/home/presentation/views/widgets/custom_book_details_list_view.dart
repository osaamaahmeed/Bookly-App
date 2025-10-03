import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class CustomBookDetialsListView extends StatelessWidget {
  const CustomBookDetialsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: CustomBookImage(),
          );
        },
      ),
    );
  }
}