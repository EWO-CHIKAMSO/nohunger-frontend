import 'package:flutter/material.dart';

class BannerB2 extends StatelessWidget {
  const BannerB2({
    super.key,
    required this.image,
    required this.press,
    required this.children,
  });

  final String image;
  final VoidCallback press;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.87,
      child: GestureDetector(
        onTap: press,
        child: Stack(
          children: [
            // Use Image.asset for local images
            Image.asset(image, fit: BoxFit.cover), // Updated line
            Container(color: Colors.black45),
            ...children,
          ],
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';

// import '../../network_image_with_loader.dart';

// class BannerB2 extends StatelessWidget {
//   const BannerB2(
//       {super.key,
//       required this.image,
//       required this.press,
//       required this.children});

//   final String image;
//   final VoidCallback press;
//   final List<Widget> children;

//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: 1.87,
//       child: GestureDetector(
//         onTap: press,
//         child: Stack(
//           children: [
//             NetworkImageWithLoader(image, radius: 0),
//             Container(color: Colors.black45),
//             ...children,
//           ],
//         ),
//       ),
//     );
//   }
// }