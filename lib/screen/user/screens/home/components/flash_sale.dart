import 'package:nohunger/route/route_constants.dart';
import 'package:nohunger/screen/user/components/Banner/B2/banner_b2_with_counter.dart';
import 'package:nohunger/screen/user/components/product/product_card.dart';
import 'package:nohunger/screen/user/models/product_model.dart';
import 'package:nohunger/screen/user/screens/home/components/section_header.dart';
import 'package:nohunger/utilities/constants.dart';
import 'package:flutter/material.dart';


class FlashSale extends StatelessWidget {
  const FlashSale({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // While loading show 👇
        // const BannerB2WithCounterSkelton(),
        BannerB2WithCounter(
          duration: const Duration(hours: 8),
          text: "Super Flash Sale \n50% Off",
          press: () {},
        ),
        const SizedBox(height: defaultPadding * 1.5),
        SectionHeader(
          title: "Flash sale",
          onViewMore: () {
            // Handle View More action
          },
        ),
        // While loading show 👇
        // const ProductsSkelton(),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            // Find demoFlashSaleProducts on models/ProductModel.dart
            itemCount: demoFlashSaleProducts.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(
                left: defaultPadding,
                right: index == demoFlashSaleProducts.length - 1
                    ? defaultPadding
                    : 0,
              ),
              child: ProductCard(
                image: demoFlashSaleProducts[index].image,
                brandName: demoFlashSaleProducts[index].brandName,
                title: demoFlashSaleProducts[index].title,
                price: demoFlashSaleProducts[index].price,
                priceAfterDiscount:
                    demoFlashSaleProducts[index].priceAfterDiscount,
                dicountpercent: demoFlashSaleProducts[index].dicountpercent,
                press: () {
                  Navigator.pushNamed(context, productDetailsScreenRoute,
                      arguments: index.isEven);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
