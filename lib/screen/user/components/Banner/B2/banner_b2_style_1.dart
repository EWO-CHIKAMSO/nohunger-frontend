import 'package:nohunger/screen/user/components/Banner/B2/banner_b2.dart';
import 'package:nohunger/utilities/constants.dart';
import 'package:flutter/material.dart';

class BannerB2Style1 extends StatelessWidget {
  const BannerB2Style1({
    super.key,
    this.image = "assets/images/user/stocks/raw/ijebu_garri.png",
    required this.text,
    required this.press,
  });
  final String? image;
  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return BannerB2(
      image: image!,
      press: press,
      children: [
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(flex: 2),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Text(
                  text,
                  style: const TextStyle(
                    fontFamily: grandisExtendedFont,
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
              const Spacer(),
              const Text(
                "Shop now",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                width: 64,
                child: Divider(
                  color: Colors.white,
                  thickness: 2,
                ),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ],
    );
  }
}





// import 'package:client/screen/user/components/Banner/B2/banner_b2.dart';
// import 'package:client/utilities/constants.dart';
// import 'package:flutter/material.dart';


// class BannerB2Style1 extends StatelessWidget {
//   const BannerB2Style1({
//     super.key,
//     this.image = "https://i.imgur.com/UP7xhPG.png",
//     required this.text,
//     required this.press,
//   });
//   final String? image;
//   final String text;
//   final VoidCallback press;

//   @override
//   Widget build(BuildContext context) {
//     return BannerB2(
//       image: image!,
//       press: press,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(defaultPadding),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Spacer(flex: 2),
//               SizedBox(
//                 width: MediaQuery.of(context).size.width * 0.75,
//                 child: Text(
//                   text,
//                   style: const TextStyle(
//                     fontFamily: grandisExtendedFont,
//                     fontWeight: FontWeight.w600,
//                     fontSize: 24,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               const Spacer(),
//               const Text(
//                 "Shop now",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               const SizedBox(
//                 width: 64,
//                 child: Divider(
//                   color: Colors.white,
//                   thickness: 2,
//                 ),
//               ),
//               const Spacer(flex: 2),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }