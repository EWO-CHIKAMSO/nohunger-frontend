import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'error_info.dart';

class NoResultsScreen extends StatelessWidget {
  const NoResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Spacer(flex: 2),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: SvgPicture.asset(
                    'assets/images/user/svg/no_results.svg',
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              const Spacer(flex: 2),
              ErrorInfo(
                title: "No Results!",
                description:
                    "We couldn't find any matches for your search. Try using different terms or browse our categories.",
                btnText: "Search again",
                press: () {
                  // Handle the "Search again" button press
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}