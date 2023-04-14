import 'package:flutter/material.dart';

class ItemKeyword extends StatelessWidget {
  final String content;

  const ItemKeyword({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: Colors.grey),
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: Text(
        content,
        style: const TextStyle(
          fontSize: 14.0,
          color: Colors.black,
        ),
      ),
    );
  }
}
