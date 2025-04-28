import 'package:flutter/material.dart';
import 'package:nohunger/utilities/constants.dart'; // Ensure this import is correct
import '../network_image_with_loader.dart'; // Ensure this import is correct

class CustomProductCard extends StatelessWidget {
  const CustomProductCard({
    super.key,
    required this.image,
    required this.title,
    required this.rating,
    required this.soldCount,
    required this.price,
  });

  final String image, title;
  final double rating, price;
  final int soldCount;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadious),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Reduced height of the image
          AspectRatio(
            aspectRatio: 1.2, // Adjusted aspect ratio to reduce height
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                  top:  Radius.circular(defaultBorderRadious)),
              child: NetworkImageWithLoader(image, radius: 0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(defaultPadding / 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontSize: 14),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: defaultPadding / 4),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    const SizedBox(width: defaultPadding / 4),
                    Text(
                      '$rating',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 12),
                    ),
                    const SizedBox(width: defaultPadding / 2),
                    Text(
                      '($soldCount Sold)',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: defaultPadding / 4),
                Text(
                  '#$price',
                  style: const TextStyle(
                    color: Color(0xFF31B0D8),
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}