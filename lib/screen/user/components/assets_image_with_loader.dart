import 'package:nohunger/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'dart:async'; // For Timer

import 'skelton/skelton.dart'; // Import the skeleton widget

class AssetsImageWithLoader extends StatefulWidget {
  final BoxFit fit;
  final String src;
  final double radius;

  const AssetsImageWithLoader(
    this.src, {
    super.key,
    this.fit = BoxFit.cover,
    this.radius = defaultPadding,
  });

  @override
  State<AssetsImageWithLoader> createState() => _AssetsImageWithLoaderState();
}

class _AssetsImageWithLoaderState extends State<AssetsImageWithLoader> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Simulate a loading delay for the skeleton
    Timer(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
      child: _isLoading
          ? const Skeleton() // Show skeleton while "loading"
          : Image.asset(
              widget.src,
              fit: widget.fit,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error); // Show error icon if image fails to load
              },
            ),
    );
  }
}