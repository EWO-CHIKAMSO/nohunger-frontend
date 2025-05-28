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
                child: GestureDetector(
                  onTap: (){
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      builder: (context) => addressButtomSheet(context),
                    );
                  },
                  child: Row(
                   children: [
                    const Icon(Icons.location_on, color: Colors.indigo,size: 18,),
                    const SizedBox(width: 8,),
                   
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

// Special Offers Banner Widget
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
              height: 112, 
              width: 112,
              child: Image.network(
                'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=400&q=80',
                fit: BoxFit.cover, 
              ),
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}
// // Address Bottom Sheet Widget
Widget addressButtomSheet(BuildContext context) {
  final streetAddressController = TextEditingController();
  final homeAddressController = TextEditingController();
  String? selectedCity; 


  final List<String> cities = ['New York', 'Los Angeles', 'Chicago', 'Houston', 'Phoenix'];

  return StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) {
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Delivery Address',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 15),
            // City selection dropdown

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[400]!),
              ),
              child: DropdownButton<String>(
                value: selectedCity,
                hint: const Text('Select City'),
                isExpanded: true,
                underline: Container(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedCity = newValue;
                  });
                },
                items: cities.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    // controller: streetAddressController,
                    decoration: const InputDecoration(
                      labelText: 'Street Address',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    // controller: homeAddressController,
                    decoration: const InputDecoration(
                      labelText: 'Home Address',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  String streetAddress = streetAddressController.text;
                  String homeAddress = homeAddressController.text;

                 
                  print('Street Address: $streetAddress');
                  print('Home Address: $homeAddress');
                  if (selectedCity != null) {
                    print('Selected City: $selectedCity');
                  }

                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  textStyle: const TextStyle(fontSize: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Save Address',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
