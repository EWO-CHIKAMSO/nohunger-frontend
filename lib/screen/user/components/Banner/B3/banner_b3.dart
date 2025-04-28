import 'package:nohunger/screen/user/components/assets_image_with_loader.dart';
import 'package:flutter/material.dart';

// import '../../network_image_with_loader.dart';

class BannerB3 extends StatelessWidget {
  const BannerB3(
      {super.key,
      required this.image,
      required this.press,
      required this.children});

  final String image;
  final VoidCallback press;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.56,
      child: GestureDetector(
        onTap: press,
        child: Stack(
          children: [
            AssetsImageWithLoader(image, radius: 0),
            Container(color: Colors.black45),
            ...children,
          ],
        ),
      ),
    );
  }
}
