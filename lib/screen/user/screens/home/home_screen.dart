import 'package:nohunger/route/route_constants.dart';
import 'package:nohunger/screen/user/components/Banner/B3/banner_b3_style_1.dart';
import 'package:nohunger/screen/user/screens/home/components/just_for_you.dart';
import 'package:nohunger/screen/user/screens/home/components/popular_product.dart';
import 'package:nohunger/screen/user/screens/home/components/popular_vendor.dart';
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
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
             SliverToBoxAdapter(child:
            Container(
              color:Colors.white,
              height: 40,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                 children: [
                 
                    Text(
                    'Deliver to',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).textTheme.bodySmall?.color,
                    ),
                  ),
                  SizedBox(width:8 ,),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Current Location',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                        ),
                      ),
                      const Icon(Icons.arrow_drop_down),
                    ],
                  ),
                  ]
                  ),
              ),
            )),
            const SliverToBoxAdapter(child: OffersCarouselAndCategories()),
            const SliverToBoxAdapter(child: DiscoverMore()),
            const SliverToBoxAdapter(child: ShopSection()),
            // const SliverToBoxAdapter(child: RewardsSection()), 
            // const SliverToBoxAdapter(child: PopularProducts()),
            
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
            const SliverToBoxAdapter(child: SizedBox(height: 20,),),
            const SliverToBoxAdapter(child: SpecialOffersBanner() ),
           SliverToBoxAdapter(child: PopularVendorsSection()),
          ],
        ),
      ),
    );
  }
}


class SpecialOffersBanner extends StatelessWidget {
  const SpecialOffersBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 128,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 133, 40, 246),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.indigo.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                  'Special Offers',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                  'Get 20% off on your first order!',
                  style: TextStyle(
                    color: Colors.indigo[100],
                    fontSize: 14,
                  ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                  height: 32,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: const Size(80, 32),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    ),
                    child: const Text(
                    'Order Now',
                    style: TextStyle(
                      color: Colors.indigo,
                      fontWeight: FontWeight.w500,
                    ),
                    ),
                  ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: SizedBox(
              height: 112, // Match the container height
              width: 112,
              child: Image.network(
                'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=400&q=80',
                fit: BoxFit.cover, // Cover the entire SizedBox
              ),
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}