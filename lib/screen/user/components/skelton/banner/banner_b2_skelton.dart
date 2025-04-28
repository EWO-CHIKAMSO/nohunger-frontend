import 'package:nohunger/utilities/constants.dart';
import 'package:flutter/material.dart';


import '../skelton.dart';

class BannerB2Skelton extends StatelessWidget {
  const BannerB2Skelton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const AspectRatio(
      aspectRatio: 2.56,
      child: Stack(
        children: [
          Skeleton(radious: 0),
          Padding(
            padding: EdgeInsets.all(defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Skeleton(
                  height: 24,
                  width: 200,
                ),
                SizedBox(height: defaultPadding / 2),
                Skeleton(
                  height: 24,
                  width: 160,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
