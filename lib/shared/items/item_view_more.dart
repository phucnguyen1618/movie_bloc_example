import 'package:flutter/material.dart';

class ItemViewMore extends StatelessWidget {
  final Function() onViewMore;

  const ItemViewMore({Key? key, required this.onViewMore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onViewMore(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.teal,
            ),
            child: const Icon(Icons.arrow_forward,
                color: Colors.white, size: 16.0),
          ),
          const SizedBox(width: 12.0),
          const Text(
            'View More',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 16.0, color: Colors.teal),
          ),
        ],
      ),
    );
  }
}
