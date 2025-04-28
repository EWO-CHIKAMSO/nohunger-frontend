import 'package:nohunger/route/screen_export.dart';
import 'package:flutter/material.dart';
import 'package:nohunger/utilities/constants.dart';

class ShopDetailScreen extends StatelessWidget {
  const ShopDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop Details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(defaultBorderRadious),
              child: Image.network(
                "https://i.imgur.com/CGCyp1d.png", // Replace with actual shop image URL
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: defaultPadding),
            const Text(
              "RazinShop", // Replace with actual shop name
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: defaultPadding / 2),
            const Text(
              "Description", // Replace with actual shop description
              style: TextStyle(
                fontSize: 16,
                color: blackColor60,
              ),
            ),
            const SizedBox(height: defaultPadding),
            const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
              style: TextStyle(
                fontSize: 14,
                color: blackColor40,
              ),
            ),
            const SizedBox(height: defaultPadding),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShopHomeScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(defaultBorderRadious),
                ),
              ),
              child: const Text(
                "Visit Shop",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: whiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}