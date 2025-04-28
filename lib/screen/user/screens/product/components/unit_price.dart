import 'package:nohunger/components/naira_svg_icon.dart';
import 'package:nohunger/utilities/constants.dart';
import 'package:flutter/material.dart';


class UnitPrice extends StatelessWidget {
  const UnitPrice({
    super.key,
    required this.price,
    this.priceAfterDiscount,
  });

  final double price;
  final double? priceAfterDiscount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Unit price",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: defaultPadding / 1),
        Row(
          children: [
            const NairaSvgIcon(color: Colors.black), 
            Text(
              priceAfterDiscount == null
                  ? price.toStringAsFixed(2)
                  : priceAfterDiscount!.toStringAsFixed(2),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            if (priceAfterDiscount != null)
              Row(
                children: [
                  const SizedBox(width: 8), 
                  const NairaSvgIcon(color: Colors.grey), 
                  Text(
                    price.toStringAsFixed(2),
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).textTheme.bodyMedium!.color,
                        decoration: TextDecoration.lineThrough),
                  ),
                ],
              ),
          ],
        ),
      ],
    );
  }
}


// import 'package:client/utilities/constants.dart';
// import 'package:flutter/material.dart';


// class UnitPrice extends StatelessWidget {
//   const UnitPrice({
//     super.key,
//     required this.price,
//     this.priceAfterDiscount,
//   });

//   final double price;
//   final double? priceAfterDiscount;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "Unit price",
//           style: Theme.of(context).textTheme.titleSmall,
//         ),
//         const SizedBox(height: defaultPadding / 1),
//         Text.rich(
//           TextSpan(
//             text: priceAfterDiscount == null
//                 ? "\$${price.toStringAsFixed(2)}  "
//                 : "\$${priceAfterDiscount!.toStringAsFixed(2)}  ",
//             style: Theme.of(context).textTheme.titleLarge,
//             children: [
//               if (priceAfterDiscount != null)
//                 TextSpan(
//                   text: "\$${price.toStringAsFixed(2)}",
//                   style: Theme.of(context).textTheme.titleSmall!.copyWith(
//                       color: Theme.of(context).textTheme.bodyMedium!.color,
//                       decoration: TextDecoration.lineThrough),
//                 ),
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }