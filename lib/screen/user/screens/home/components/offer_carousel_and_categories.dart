import 'package:nohunger/utilities/constants.dart';
import 'package:flutter/material.dart';

import 'categories.dart';
import 'offers_carousel.dart';

class OffersCarouselAndCategories extends StatelessWidget {
  const OffersCarouselAndCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // While loading use 👇
        // const OffersSkelton(),
        OffersCarousel(),
        SizedBox(height: defaultPadding * 1.5),

        // While loading use 👇
        // const CategoriesSkelton(),
        Categories(),
      ],
    );
  }
}