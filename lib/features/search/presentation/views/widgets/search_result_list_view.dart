import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text('Comming Soon', style: Styles.textStyle18),
          // child: BookListViewItem(),
        );
      },
      itemCount: 1,
      padding: EdgeInsets.zero,
      // shrinkWrap: true,
      // physics: const NeverScrollableScrollPhysics(),
    );
  }
}
