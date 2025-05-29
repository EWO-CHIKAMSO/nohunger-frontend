import 'package:nohunger/utilities/constants.dart';
import 'package:flutter/material.dart';
import '../assets_image_with_loader.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.image,
    required this.brandName,
    required this.title,
    required this.price,
    this.priceAfterDiscount,
    this.dicountpercent,
    required this.press,
  });

  final String image, brandName, title;
  final double price;
  final double? priceAfterDiscount;
  final int? dicountpercent;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: 170,
        margin: const EdgeInsets.only(right: 8,),
        decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(defaultBorderRadious),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 110,
              width: double.infinity,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(8),
                    ),
                    child: AssetsImageWithLoader(
                      image,
                      radius: 0, // No radius since we're using ClipRRect
                    ),
                  ),
                  if (dicountpercent != null)
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: errorColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          "$dicountpercent% off",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    brandName.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (priceAfterDiscount != null)
                        Row(
                          children: [
                            Text(
                              "#$priceAfterDiscount",
                              style: const TextStyle(
                                color: Color(0xFF31B0D8),
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "#$price",
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ],
                        )
                      else
                        Text(
                          "#$price",
                          style: const TextStyle(
                            color: Color(0xFF31B0D8),
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: const Color(0xFF31B0D8).withOpacity(0.2),
                          shape: BoxShape.rectangle,
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Color(0xFF31B0D8),
                          size: 14,
                        ),
                      ),
                    ],
                  ),
                ],
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


// import '../network_image_with_loader.dart';

// class ProductCard extends StatelessWidget {
//   const ProductCard({
//     super.key,
//     required this.image,
//     required this.brandName,
//     required this.title,
//     required this.price,
//     this.priceAfterDiscount,
//     this.dicountpercent,
//     required this.press,
//   });
//   final String image, brandName, title;
//   final double price;
//   final double? priceAfterDiscount;
//   final int? dicountpercent;
//   final VoidCallback press;

//   @override
//   Widget build(BuildContext context) {
//     return OutlinedButton(
//       onPressed: press,
//       style: OutlinedButton.styleFrom(
//           minimumSize: const Size(140, 220),
//           maximumSize: const Size(140, 220),
//           padding: const EdgeInsets.all(8)),
//       child: Column(
//         children: [
//           AspectRatio(
//             aspectRatio: 1.15,
//             child: Stack(
//               children: [
//                 NetworkImageWithLoader(image, radius: defaultBorderRadious),
//                 if (dicountpercent != null)
//                   Positioned(
//                     right: defaultPadding / 2,
//                     top: defaultPadding / 2,
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: defaultPadding / 2),
//                       height: 16,
//                       decoration: const BoxDecoration(
//                         color: errorColor,
//                         borderRadius: BorderRadius.all(
//                             Radius.circular(defaultBorderRadious)),
//                       ),
//                       child: Text(
//                         "$dicountpercent% off",
//                         style: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 10,
//                             fontWeight: FontWeight.w500),
//                       ),
//                     ),
//                   )
//               ],
//             ),
//           ),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(
//                   horizontal: defaultPadding / 2, vertical: defaultPadding / 2),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     brandName.toUpperCase(),
//                     style: Theme.of(context)
//                         .textTheme
//                         .bodyMedium!
//                         .copyWith(fontSize: 10),
//                   ),
//                   const SizedBox(height: defaultPadding / 2),
//                   Text(
//                     title,
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                     style: Theme.of(context)
//                         .textTheme
//                         .titleSmall!
//                         .copyWith(fontSize: 12),
//                   ),
//                   const Spacer(),
//                   priceAfterDiscount != null
//                       ? Row(
//                           children: [
//                             Text(
//                               "#$priceAfterDiscount",
//                               style: const TextStyle(
//                                 color: Color(0xFF31B0D8),
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 12,
//                               ),
//                             ),
//                             const SizedBox(width: defaultPadding / 4),
//                             Text(
//                               "#$price",
//                               style: TextStyle(
//                                 color: Theme.of(context)
//                                     .textTheme
//                                     .bodyMedium!
//                                     .color,
//                                 fontSize: 10,
//                                 decoration: TextDecoration.lineThrough,
//                               ),
//                             ),
//                           ],
//                         )
//                       : Text(
//                           "#$price",
//                           style: const TextStyle(
//                             color: Color(0xFF31B0D8),
//                             fontWeight: FontWeight.w500,
//                             fontSize: 12,
//                           ),
//                         ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }