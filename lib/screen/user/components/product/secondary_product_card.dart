import 'package:nohunger/screen/user/components/assets_image_with_loader.dart';
import 'package:nohunger/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:nohunger/components/naira_svg_icon.dart';

class SecondaryProductCard extends StatelessWidget {
  const SecondaryProductCard({
    super.key,
    required this.image,
    required this.brandName,
    required this.title,
    required this.price,
    this.priceAfterDiscount,
    this.dicountpercent,
    this.press,
    this.style,
  });
  final String image, brandName, title;
  final double price;
  final double? priceAfterDiscount;
  final int? dicountpercent;
  final VoidCallback? press;
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 114,
      
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
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: press,
          borderRadius: BorderRadius.circular(defaultBorderRadious),
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 1.25,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.horizontal(
                        left: Radius.circular(defaultBorderRadious),
                      ),
                      child: AssetsImageWithLoader(image, radius: 0),
                    ),
                    if (dicountpercent != null)
                      Positioned(
                        right: defaultPadding / 2,
                        top: defaultPadding / 2,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultPadding / 2),
                          height: 16,
                          decoration: const BoxDecoration(
                            color: errorColor,
                            borderRadius: BorderRadius.all(
                                Radius.circular(defaultBorderRadious)),
                          ),
                          child: Text(
                            "$dicountpercent% off",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      )
                  ],
                ),
              ),
              const SizedBox(width: defaultPadding / 4),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(defaultPadding / 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        brandName.toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontSize: 10),
                      ),
                      const SizedBox(height: defaultPadding / 2),
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontSize: 12),
                      ),
                      SizedBox(height: 30,),
                      priceAfterDiscount != null
                          ? Row(
                              children: [
                                const NairaSvgIcon(
                                  color: Color(0xFF31B0D8),
                                ),
                                Text(
                                  priceAfterDiscount.toString(),
                                  style: const TextStyle(
                                    color: Color(0xFF31B0D8),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(width: defaultPadding / 4),
                                NairaSvgIcon(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .color,
                                ),
                                Text(
                                  price.toString(),
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .color,
                                    fontSize: 10,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            )
                          : Row(
                              children: [
                                const NairaSvgIcon(
                                  color: Color(0xFF31B0D8),
                                ),
                                Text(
                                  price.toString(),
                                  style: const TextStyle(
                                    color: Color(0xFF31B0D8),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// import 'package:client/screen/user/components/assets_image_with_loader.dart';
// import 'package:client/utilities/constants.dart';
// import 'package:flutter/material.dart';



// class SecondaryProductCard extends StatelessWidget {
//   const SecondaryProductCard({
//     super.key,
//     required this.image,
//     required this.brandName,
//     required this.title,
//     required this.price,
//     this.priceAfterDiscount,
//     this.dicountpercent,
//     this.press,
//     this.style,
//   });
//   final String image, brandName, title;
//   final double price;
//   final double? priceAfterDiscount;
//   final int? dicountpercent;
//   final VoidCallback? press;

//   final ButtonStyle? style;

//   @override
//   Widget build(BuildContext context) {
//     return OutlinedButton(
//       onPressed: () {},
//       style: style ??
//           OutlinedButton.styleFrom(
//               minimumSize: const Size(256, 114),
//               maximumSize: const Size(256, 114),
//               padding: const EdgeInsets.all(8)),
//       child: Row(
//         children: [
//           AspectRatio(
//             aspectRatio: 1.15,
//             child: Stack(
//               children: [
//                 AssetsImageWithLoader(image, radius: defaultBorderRadious),
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
//           const SizedBox(width: defaultPadding / 4),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(defaultPadding / 2),
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
//                               "\$$priceAfterDiscount",
//                               style: const TextStyle(
//                                 color: Color(0xFF31B0D8),
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 12,
//                               ),
//                             ),
//                             const SizedBox(width: defaultPadding / 4),
//                             Text(
//                               "\$$price",
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
//                           "\$$price",
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