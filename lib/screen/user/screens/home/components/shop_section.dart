// shop_section.dart
import 'package:nohunger/route/screen_export.dart';
import 'package:nohunger/screen/user/screens/home/components/section_header.dart';
import 'package:nohunger/utilities/constants.dart';
import 'package:flutter/material.dart';

import 'shop_item.dart';

class ShopSection extends StatelessWidget {
  const ShopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: defaultPadding * 1.2),
        SectionHeader(
          title: "Best Vendors",
          onViewMore: () {
            // Handle View More action
          },
        ),
        // While loading use 👇
        // const ProductsSkelton(),
        SizedBox(
          height: 150,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            children: [
              ShopItem(
                shopName: "RazinShop",
                imagePath: shopDemoImg1, // Local asset path
                onTap: () => _navigateToShopDetail(context),
              ),
              ShopItem(
                shopName: "SJA",
                imagePath: shopDemoImg1, // Local asset path
                onTap: () => _navigateToShopDetail(context),
              ),
              ShopItem(
                shopName: "alesha mart",
                imagePath: shopDemoImg1, // Local asset path
                onTap: () => _navigateToShopDetail(context),
              ),
              ShopItem(
                shopName: "alesha mart",
                imagePath: shopDemoImg1, // Local asset path
                onTap: () => _navigateToShopDetail(context),
              ),
              ShopItem(
                shopName: "alesha mart",
                imagePath: shopDemoImg1, // Local asset path
                onTap: () => _navigateToShopDetail(context),
              ),
              // Add more shops as needed
            ],
          ),
        ),
      ],
    );
  }

  static void _navigateToShopDetail(BuildContext context) {
    Navigator.pushNamed(context, shopDetailScreenRoute);
  }
}


// import 'package:client/route/screen_export.dart';
// import 'package:client/utilities/constants.dart';
// import 'package:flutter/material.dart';

// import 'shop_item.dart';

// class ShopSection extends StatelessWidget {
//   const ShopSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const SizedBox(height: defaultPadding / 2),
//         Padding(
//           padding: const EdgeInsets.all(defaultPadding),
//           child: Text(
//             "Shops",
//             style: Theme.of(context).textTheme.titleSmall,
//           ),
//         ),
//         // While loading use 👇
//         // const ProductsSkelton(),
//         SizedBox(
//           height: 150,
//           child: ListView(
//             scrollDirection: Axis.horizontal,
//             padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
//             children:  [
//               ShopItem(
//                 shopName: "RazinShop",
//                 imageUrl: "https://i.imgur.com/CGCyp1d.png",
//                 onTap: () => _navigateToShopDetail(context),
//               ),
//               ShopItem(
//                 shopName: "SJA",
//                 imageUrl: "https://i.imgur.com/AkzWQuJ.png",
//                 onTap: () => _navigateToShopDetail(context),
//               ),
//               ShopItem(
//                 shopName: "alesha mart",
//                 imageUrl: "https://i.imgur.com/J7mGZ12.png",
//                 onTap: () => _navigateToShopDetail(context),
//               ),
//               // Add more shops as needed
//             ],
//           ),
//         ),
//       ],
//     );
//   }

// static void _navigateToShopDetail(BuildContext context) {
//   Navigator.pushNamed(context, shopDetailScreenRoute);
// }
// }