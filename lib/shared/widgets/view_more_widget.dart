import 'package:flutter/material.dart';

class ViewMoreWidget extends StatelessWidget {
  final Function() onViewMore;

  const ViewMoreWidget({Key? key, required this.onViewMore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onViewMore(),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: const Icon(Icons.arrow_forward, color: Colors.teal),
            ),
            const Text(
              'View All',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.teal,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
