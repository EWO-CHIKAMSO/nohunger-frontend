import 'package:flutter/material.dart';
import 'package:nohunger/utilities/constants.dart';

class DiscoverMore extends StatelessWidget {
  const DiscoverMore({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:0, horizontal: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Discover More",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: defaultPadding),
          // First row with two big containers
          Row(
            children: [
              Expanded(
                child: _buildBigContainer(
                  title: "QuickMart",
                  subtitle: "16 mins",
                  image: "assets/images/user/stocks/other/provision.png",
                  color: Colors.green[50]!,
                ),
              ),
              const SizedBox(width: defaultPadding),
              Expanded(
                child: _buildBigContainer(
                  title: "Restaurants",
                  image: "assets/images/user/stocks/other/provision.png",
                  color: Colors.green[50]!,
                ),
              ),
            ],
          ),
          const SizedBox(height: defaultPadding),
          // Second row with four small containers
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildSmallContainer(
                title: "Mama Put",
                image: "assets/images/user/stocks/other/provision.png",
                isNew: true,
              ),
              _buildSmallContainer(
                title: "Pharmacy & clinics",
                image: "assets/images/user/stocks/other/provision.png",
              ),
              _buildSmallContainer(
                title: "SuperMart & Stores",
                image: "assets/images/user/stocks/other/provision.png",
              ),
              _buildSmallContainer(
                title: "More",
                image: "assets/images/user/stocks/other/provision.png",
                isNew: true,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBigContainer({
    required String title,
    String? subtitle,
    required String image,
    required Color color,
  }) {
    return Container(
      height: 140,
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (subtitle != null) ...[
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ],
          ),
          const Spacer(),
          Center(
            child: Image.asset(
              image,
              height: 70,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSmallContainer({
    required String title,
    required String image,
    bool isNew = false,
  }) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.green[50]!,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Image.asset(
                  image,
                  height: 40,
                  width: 40,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            if (isNew)
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'NEW',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 80,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}