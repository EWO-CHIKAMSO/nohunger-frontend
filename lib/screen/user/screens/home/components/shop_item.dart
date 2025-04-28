// shop_item.dart
import 'package:nohunger/utilities/constants.dart';
import 'package:flutter/material.dart';

class ShopItem extends StatelessWidget {
  final String shopName;
  final String imagePath; // Changed from imageUrl to imagePath
  final VoidCallback onTap;

  const ShopItem({
    super.key,
    required this.shopName,
    required this.imagePath, // Updated parameter name
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: defaultPadding),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(defaultBorderRadious),
              child: Image.asset(
                imagePath, // Use Image.asset for local images
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error); // Show error icon if image fails to load
                },
              ),
            ),
            const SizedBox(height: defaultPadding / 2),
            Text(
              shopName,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:client/utilities/constants.dart';
// import 'package:flutter/material.dart';

// class ShopItem extends StatelessWidget {
//   final String shopName;
//   final String imageUrl;
//   final VoidCallback onTap;

//   const ShopItem({
//     super.key,
//     required this.shopName,
//     required this.imageUrl,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         margin: const EdgeInsets.only(right: defaultPadding),
//         child: Column(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(defaultBorderRadious),
//               child: Image.network(
//                 imageUrl,
//                 width: 100,
//                 height: 100,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             const SizedBox(height: defaultPadding / 2),
//             Text(
//               shopName,
//               style: const TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }