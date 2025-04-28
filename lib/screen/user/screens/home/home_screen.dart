import 'package:nohunger/route/route_constants.dart';
import 'package:nohunger/screen/user/components/Banner/B3/banner_b3_style_1.dart';
import 'package:nohunger/screen/user/screens/home/components/just_for_you.dart';
import 'package:nohunger/screen/user/screens/home/components/popular_product.dart';
import 'package:nohunger/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'components/flash_sale.dart';
import 'components/discount_sale.dart';
import 'components/offer_carousel_and_categories.dart ';
import 'components/rewards_section.dart';
import 'components/shop_section.dart';
import 'components/discover_more.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: OffersCarouselAndCategories()),
            const SliverToBoxAdapter(child: DiscoverMore()),
            const SliverToBoxAdapter(child: RewardsSection()), 
            const SliverToBoxAdapter(child: PopularProducts()),
            const SliverToBoxAdapter(child: ShopSection()),
            const SliverPadding(
              padding: EdgeInsets.symmetric(vertical: defaultPadding * 1.5),
              sliver: SliverToBoxAdapter(child: FlashSale()),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  BannerB3Style1(
                    title: "New \narrival",
                    subtitle: "SPECIAL OFFER",
                    discountParcent: 50,
                    press: () {
                      Navigator.pushNamed(context, onSaleScreenRoute);
                    },
                  ),
                  const SizedBox(height: defaultPadding / 4),
                ],
              ),
            ),
            const SliverToBoxAdapter(child: DiscountSale()),
            const SliverToBoxAdapter(child: JustForYou()),
          ],
        ),
      ),
    );
  }
}