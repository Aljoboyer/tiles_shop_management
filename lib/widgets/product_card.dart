import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String size;
  final int pieces;

  const ProductCard({
    Key? key,
    required this.title,
    required this.size,
    required this.pieces,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1, // Elevated card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Colors.grey, width: 0.5), // Grey border
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              title,
              style: const TextStyle(
                fontSize: 18, // Larger than other text
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8), // Spacing

            // Size and Pieces in the same row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Size: $size",
                  style: const TextStyle(fontSize: 14),
                ),
                Text(
                  "Pieces: $pieces",
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
