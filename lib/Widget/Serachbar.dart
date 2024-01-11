import 'package:flutter/material.dart';

class SearchBarIcon extends StatelessWidget {
  const SearchBarIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [Icon(Icons.search)],
    );
  }
}
