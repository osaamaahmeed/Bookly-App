import 'package:flutter/material.dart';

class CustomBookImageLoadingIndecator extends StatelessWidget {
  const CustomBookImageLoadingIndecator({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(16),
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: Container(
          color: Colors.grey[50],
        )
      ),
    );;
  }
}