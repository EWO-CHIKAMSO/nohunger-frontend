import 'package:nohunger/components/naira_svg_icon.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  final String brand;
  final String title;
  final String price;
  final String originalPrice;
  final String imageUrl;

  const OrderItem({
    super.key,
    required this.brand,
    required this.title,
    required this.price,
    required this.originalPrice,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 80,
              height: 80,
              color: Colors.grey[200],
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                brand,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 10,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Row(
                    children: [
                      const NairaSvgIcon(
                        color: Color(0xFF6C5CE7),
                      ),
                      const SizedBox(width: 2),
                      Text(
                        price,
                        style: const TextStyle(
                          color: Color(0xFF6C5CE7),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 8),
                  Row(
                    children: [
                      NairaSvgIcon(
                        color: Colors.grey[400],
                      ),
                      const SizedBox(width: 2),
                      Text(
                        originalPrice,
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 14,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}