import 'package:nohunger/components/naira_svg_icon.dart';
import 'package:flutter/material.dart';

class SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isGreen;

  const SummaryRow({
    super.key,
    required this.label,
    required this.value,
    this.isGreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
          Row(
            children: [
              NairaSvgIcon(
                color: isGreen ? Colors.green : Colors.black,
              ),
              const SizedBox(width: 2),
              Text(
                value,
                style: TextStyle(
                  color: isGreen ? Colors.green : Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}