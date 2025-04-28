import 'package:nohunger/route/route_constants.dart';
import 'package:nohunger/screen/user/components/product/secondary_product_card.dart';
import 'package:nohunger/screen/user/models/product_model.dart';
import 'package:nohunger/screen/user/screens/home/components/section_header.dart';
import 'package:nohunger/utilities/constants.dart';
import 'package:flutter/material.dart';
// import 'package:shop/components/product/secondary_product_card.dart';
// import 'package:shop/models/product_model.dart';

// import '../../../../../constants.dart';
// import '../../../../../route/route_constants.dart';

class DiscountSale extends StatelessWidget {
  const DiscountSale({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: defaultPadding * 1.5),
        SectionHeader(
          title:  "Discount Stocks",
          onViewMore: () {
            // Handle View More action
          },
        ),
        // While loading use 👇
        // SeconderyProductsSkelton(),
        SizedBox(
          height: 114,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            // Find demoPopularProducts on models/ProductModel.dart
            itemCount: demoPopularProducts.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(
                left: defaultPadding,
                right: index == demoPopularProducts.length - 1
                    ? defaultPadding
                    : 0,
              ),
              child: SecondaryProductCard(
                image: demoPopularProducts[index].image,
                brandName: demoPopularProducts[index].brandName,
                title: demoPopularProducts[index].title,
                price: demoPopularProducts[index].price,
                priceAfterDiscount: demoPopularProducts[index].priceAfterDiscount,
                dicountpercent: demoPopularProducts[index].dicountpercent,
                press: () {
                  Navigator.pushNamed(context, productDetailsScreenRoute,
                      arguments: index.isEven);
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
