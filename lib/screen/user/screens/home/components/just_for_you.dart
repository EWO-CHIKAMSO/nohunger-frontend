import 'package:nohunger/screen/user/components/product/product_card.dart';
import 'package:nohunger/screen/user/models/product_model.dart';
import 'package:nohunger/utilities/constants.dart';
import 'package:flutter/material.dart';

import '../../../../../route/screen_export.dart';

// import '../../../../../constants.dart';
// import '../../../../../route/route_constants.dart';


class JustForYou extends StatelessWidget {
  const JustForYou({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: defaultPadding * 1.5),
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Text(
            "Stocks For You",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: defaultPadding,
              mainAxisSpacing: defaultPadding,
              childAspectRatio: 0.7, // Adjust this value as needed
            ),
            itemCount: 4, // Number of products
            itemBuilder: (context, index) {
              return ProductCard(
                image: demoPopularProducts[index].image,
                brandName: demoPopularProducts[index].brandName,
                title: demoPopularProducts[index].title,
                price: demoPopularProducts[index].price,
                priceAfterDiscount: demoPopularProducts[index].priceAfterDiscount,
                dicountpercent: demoPopularProducts[index].dicountpercent,
                press: () {
                  Navigator.pushNamed(context, productDetailsScreenRoute);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

// class JustForYou extends StatelessWidget {
//   const JustForYou({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const SizedBox(height: defaultPadding / 2),
//         Padding(
//           padding: const EdgeInsets.all(defaultPadding),
//           child: Text(
//             "Just For You",
//             style: Theme.of(context).textTheme.titleSmall,
//           ),
//         ),
//         // While loading use 👇
//         // const ProductsSkelton(),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
//           child: GridView.builder(
//             shrinkWrap: true, // Add this line
//             physics: const NeverScrollableScrollPhysics(), // Add this line
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               crossAxisSpacing: defaultPadding,
//               mainAxisSpacing: defaultPadding,
//               childAspectRatio: 0.75,
//             ),
//             itemCount: 4, // Number of products
//             itemBuilder: (context, index) {
//               return ProductCard(
//                 image: demoPopularProducts[index].image,
//                 brandName: demoPopularProducts[index].brandName,
//                 title: demoPopularProducts[index].title,
//                 price: demoPopularProducts[index].price,
//                 priceAfterDiscount: demoPopularProducts[index].priceAfterDiscount,
//                 dicountpercent: demoPopularProducts[index].dicountpercent,
//                 press: () {
//                   Navigator.pushNamed(context, productDetailsScreenRoute);
//                 },
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }