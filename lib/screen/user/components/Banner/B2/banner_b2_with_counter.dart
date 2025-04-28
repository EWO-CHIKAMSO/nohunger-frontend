import 'dart:async';

import 'package:nohunger/screen/user/components/Banner/B2/banner_b2.dart';
import 'package:nohunger/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


import '../../blur_container.dart';


class BannerB2WithCounter extends StatefulWidget {
  const BannerB2WithCounter({
    super.key,
    this.image = "assets/images/user/stocks/other/provision.png",
    required this.text,
    required this.duration,
    required this.press,
  });

  final String image, text;
  final Duration duration;
  final VoidCallback press;

  @override
  State<BannerB2WithCounter> createState() => _BannerB2WithCounterState();
}

class _BannerB2WithCounterState extends State<BannerB2WithCounter> {
  late Duration _duration;
  late Timer _timer;

  @override
  void initState() {
    _duration = widget.duration;
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        _duration = Duration(seconds: _duration.inSeconds - 1);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BannerB2(
      image: widget.image,
      press: widget.press,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: grandisExtendedFont,
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: defaultPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlurContainer(
                  text: _duration.inHours.toString().padLeft(2, "0"),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding / 4),
                  child: SvgPicture.asset("assets/icons/user/dot.svg"),
                ),
                BlurContainer(
                  text: _duration.inMinutes
                      .remainder(60)
                      .toString()
                      .padLeft(2, "0"),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding / 4),
                  child: SvgPicture.asset("assets/icons/user/dot.svg"),
                ),
                BlurContainer(
                  text: _duration.inSeconds
                      .remainder(60)
                      .toString()
                      .padLeft(2, "0"),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
