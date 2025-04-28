import 'package:nohunger/screen/user/components/product/product_card.dart';
import 'package:nohunger/screen/user/models/category_model.dart';
import 'package:nohunger/screen/user/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:nohunger/utilities/constants.dart';

import '../../../../route/screen_export.dart';

class ShopHomeScreen extends StatefulWidget {
  const ShopHomeScreen({super.key});

  @override
  _ShopHomeScreenState createState() => _ShopHomeScreenState();
}

class _ShopHomeScreenState extends State<ShopHomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(defaultBorderRadious),
          ),
          child: const Center(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Product',
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_basket),
            onPressed: () {
              // Implement basket functionality
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // First Section
          Container(
            color: Colors.red[400],
            padding: const EdgeInsets.all(defaultPadding),
            child: Row(
              children: [
                // Left Column
                Column(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(defaultBorderRadious),
                      ),
                      child: const Icon(Icons.store, size: 40),
                    ),
                    const SizedBox(height: defaultPadding / 2),
                    const Text(
                      "Alesha Mart",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      "9+ Products",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                // Right Column
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding / 2,
                          vertical: defaultPadding / 4),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius:
                            BorderRadius.circular(defaultBorderRadious),
                      ),
                      child: const Text(
                        "Offline",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: defaultPadding / 2),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 20),
                          Text(
                            "5.0",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Second Section
          Container(
            margin: const EdgeInsets.all(defaultPadding),
            height: 100,
            decoration: BoxDecoration(
              color: Colors.blue[200],
              borderRadius: BorderRadius.circular(defaultBorderRadious),
            ),
            child: const Center(
              child: Text(
                "Enjoy Barat Mall Fest",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          // Third Section
          Expanded(
            child: Column(
              children: [
                // Tabs
                Container(
                  color: Colors.white,
                  child: TabBar(
                    controller: _tabController,
                    labelColor: primaryColor,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: primaryColor,
                    tabs: const [
                      Tab(text: 'All Products'),
                      Tab(text: 'Categories'),
                      Tab(text: 'Reviews'),
                    ],
                  ),
                ),
                // Tab Content
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      // All Products Tab
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: defaultPadding,
                            vertical: defaultPadding),
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: defaultPadding,
                            mainAxisSpacing: defaultPadding,
                            childAspectRatio: 0.7, // Adjust this value as needed
                          ),
                          itemCount: 4, // Number of products
                          itemBuilder: (context, index) {
                            return ProductCard(
                              image: demoPopularProducts[index].image,
                              brandName: demoPopularProducts[index].brandName,
                              title: demoPopularProducts[index].title,
                              price: demoPopularProducts[index].price,
                              priceAfterDiscount:
                                  demoPopularProducts[index].priceAfterDiscount,
                              dicountpercent:
                                  demoPopularProducts[index].dicountpercent,
                              press: () {
                                Navigator.pushNamed(
                                    context, productDetailsScreenRoute);
                              },
                            );
                          },
                        ),
                      ),
                      // Categories Tab
                      Padding(
                        padding: const EdgeInsets.all(defaultPadding),
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4, // 4 items per row
                            crossAxisSpacing: defaultPadding,
                            mainAxisSpacing: defaultPadding,
                            childAspectRatio: 0.8, // Adjust aspect ratio as needed
                          ),
                          itemCount: demoCategoriesWithImage.length,
                          itemBuilder: (context, index) {
                            final category = demoCategoriesWithImage[index];
                            return CategoryItem(category: category);
                          },
                        ),
                      ),
                      // Reviews Tab
                      SingleChildScrollView(
                        padding: const EdgeInsets.all(defaultPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Rating Summary Section
                            const Text(
                              "5.0",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: defaultPadding / 2),
                            Row(
                              children: [
                                const Icon(Icons.star,
                                    color: Colors.amber, size: 20),
                                const SizedBox(width: defaultPadding / 4),
                                Expanded(
                                  child: LinearProgressIndicator(
                                    value: 1.0, // 100% for 5 stars
                                    backgroundColor: Colors.grey[300],
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                            Colors.amber),
                                  ),
                                ),
                                const SizedBox(width: defaultPadding),
                                const Text(
                                  "0.0%",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: defaultPadding / 4),
                            Row(
                              children: [
                                const Icon(Icons.star,
                                    color: Colors.amber, size: 20),
                                const SizedBox(width: defaultPadding / 4),
                                Expanded(
                                  child: LinearProgressIndicator(
                                    value: 0.0, // 0% for 4 stars
                                    backgroundColor: Colors.grey[300],
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                            Colors.amber),
                                  ),
                                ),
                                const SizedBox(width: defaultPadding),
                                const Text(
                                  "0.0%",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: defaultPadding / 4),
                            Row(
                              children: [
                                const Icon(Icons.star,
                                    color: Colors.amber, size: 20),
                                const SizedBox(width: defaultPadding / 4),
                                Expanded(
                                  child: LinearProgressIndicator(
                                    value: 0.0, // 0% for 3 stars
                                    backgroundColor: Colors.grey[300],
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                            Colors.amber),
                                  ),
                                ),
                                const SizedBox(width: defaultPadding),
                                const Text(
                                  "0.0%",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: defaultPadding / 4),
                            Row(
                              children: [
                                const Icon(Icons.star,
                                    color: Colors.amber, size: 20),
                                const SizedBox(width: defaultPadding / 4),
                                Expanded(
                                  child: LinearProgressIndicator(
                                    value: 0.0, // 0% for 2 stars
                                    backgroundColor: Colors.grey[300],
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                            Colors.amber),
                                  ),
                                ),
                                const SizedBox(width: defaultPadding),
                                const Text(
                                  "0.0%",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: defaultPadding / 4),
                            Row(
                              children: [
                                const Icon(Icons.star,
                                    color: Colors.amber, size: 20),
                                const SizedBox(width: defaultPadding / 4),
                                Expanded(
                                  child: LinearProgressIndicator(
                                    value: 0.0, // 0% for 1 star
                                    backgroundColor: Colors.grey[300],
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                            Colors.amber),
                                  ),
                                ),
                                const SizedBox(width: defaultPadding),
                                const Text(
                                  "0.0%",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: defaultPadding),
                            // Review List
                            const Text(
                              "Reviews (0)",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: defaultPadding),
                            const Center(
                              child: Text(
                                "No reviews yet.",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final CategoryModel category;

  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (category.image != null)
          ClipRRect(
            borderRadius: BorderRadius.circular(defaultBorderRadious),
            child: Image.network(
              category.image!,
              width: 60, // Adjust size as needed
              height: 60, // Adjust size as needed
              fit: BoxFit.cover,
            ),
          ),
        const SizedBox(height: defaultPadding / 2),
        Text(
          category.title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}



// import 'package:client/screen/user/components/product/product_card.dart';
// import 'package:client/screen/user/models/category_model.dart';
// import 'package:client/screen/user/models/product_model.dart';
// import 'package:flutter/material.dart';
// import 'package:client/utilities/constants.dart';
// import 'package:client/screen/user/components/product/custom_product_card.dart';

// import '../../../../route/screen_export.dart';

// class ShopHomeScreen extends StatefulWidget {
//   const ShopHomeScreen({super.key});

//   @override
//   _ShopHomeScreenState createState() => _ShopHomeScreenState();
// }

// class _ShopHomeScreenState extends State<ShopHomeScreen>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: Container(
//           width: double.infinity,
//           height: 40,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(defaultBorderRadious),
//           ),
//           child: const Center(
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: 'Search Product',
//                 border: InputBorder.none,
//                 prefixIcon: Icon(Icons.search),
//               ),
//             ),
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.shopping_basket),
//             onPressed: () {
//               // Implement basket functionality
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           // First Section
//           Container(
//             color: Colors.red[400],
//             padding: const EdgeInsets.all(defaultPadding),
//             child: Row(
//               children: [
//                 // Left Column
//                 Column(
//                   children: [
//                     Container(
//                       width: 60,
//                       height: 60,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius:
//                             BorderRadius.circular(defaultBorderRadious),
//                       ),
//                       child: const Icon(Icons.store, size: 40),
//                     ),
//                     const SizedBox(height: defaultPadding / 2),
//                     const Text(
//                       "Alesha Mart",
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                     const Text(
//                       "9+ Products",
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const Spacer(),
//                 // Right Column
//                 Column(
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: defaultPadding / 2,
//                           vertical: defaultPadding / 4),
//                       decoration: BoxDecoration(
//                         color: Colors.grey[300],
//                         borderRadius:
//                             BorderRadius.circular(defaultBorderRadious),
//                       ),
//                       child: const Text(
//                         "Offline",
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: defaultPadding / 2),
//                     Container(
//                       width: 50,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         color: Colors.black.withOpacity(0.5),
//                         shape: BoxShape.circle,
//                       ),
//                       child: const Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(Icons.star, color: Colors.amber, size: 20),
//                           Text(
//                             "5.0",
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           // Second Section
//           Container(
//             margin: const EdgeInsets.all(defaultPadding),
//             height: 100,
//             decoration: BoxDecoration(
//               color: Colors.blue[200],
//               borderRadius: BorderRadius.circular(defaultBorderRadious),
//             ),
//             child: const Center(
//               child: Text(
//                 "Enjoy Barat Mall Fest",
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//           // Third Section
//           Expanded(
//             child: Column(
//               children: [
//                 // Tabs
//                 Container(
//                   color: Colors.white,
//                   child: TabBar(
//                     controller: _tabController,
//                     labelColor: primaryColor,
//                     unselectedLabelColor: Colors.grey,
//                     indicatorColor: primaryColor,
//                     tabs: const [
//                       Tab(text: 'All Products'),
//                       Tab(text: 'Categories'),
//                       Tab(text: 'Reviews'),
//                     ],
//                   ),
//                 ),
//                 // Tab Content
//                 Expanded(
//                   child: TabBarView(
//                     controller: _tabController,
//                     children: [
//                       // All Products Tab

//                       // Padding(
//                       //   padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
//                       //   child: GridView.builder(
//                       //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                       //       crossAxisCount: 2,
//                       //       crossAxisSpacing: defaultPadding,
//                       //       mainAxisSpacing: defaultPadding,
//                       //       childAspectRatio: 0.75,
//                       //     ),
//                       //     itemCount: 4, // Number of products
//                       //     itemBuilder: (context, index) {
//                       //       return const CustomProductCard(
//                       //         image: "https://i.imgur.com/CGCyp1d.png",
//                       //         title: "Fitbit Charge 6 Fitness Tracker",
//                       //         rating: 5.0,
//                       //         soldCount: 0,
//                       //         price: 2499.99,
//                       //       );
//                       //     },
//                       //   ),
//                       // ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: defaultPadding,
//                             vertical: defaultPadding),
//                         child: GridView.builder(
//                           shrinkWrap: true,
//                           physics: const NeverScrollableScrollPhysics(),
//                           gridDelegate:
//                               const SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 2,
//                             crossAxisSpacing: defaultPadding,
//                             mainAxisSpacing: defaultPadding,
//                             childAspectRatio:
//                                 0.7, // Adjust this value as needed
//                           ),
//                           itemCount: 4, // Number of products
//                           itemBuilder: (context, index) {
//                             return ProductCard(
//                               image: demoPopularProducts[index].image,
//                               brandName: demoPopularProducts[index].brandName,
//                               title: demoPopularProducts[index].title,
//                               price: demoPopularProducts[index].price,
//                               priceAfterDiscount:
//                                   demoPopularProducts[index].priceAfterDiscount,
//                               dicountpercent:
//                                   demoPopularProducts[index].dicountpercent,
//                               press: () {
//                                 Navigator.pushNamed(
//                                     context, productDetailsScreenRoute);
//                               },
//                             );
//                           },
//                         ),
//                       ),
//                       // Categories Tab
//                       Padding(
//                         padding: const EdgeInsets.all(defaultPadding),
//                         child: GridView.builder(
//                           gridDelegate:
//                               const SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 4, // 4 items per row
//                             crossAxisSpacing: defaultPadding,
//                             mainAxisSpacing: defaultPadding,
//                             childAspectRatio:
//                                 0.8, // Adjust aspect ratio as needed
//                           ),
//                           itemCount: demoCategoriesWithImage.length,
//                           itemBuilder: (context, index) {
//                             final category = demoCategoriesWithImage[index];
//                             return CategoryItem(category: category);
//                           },
//                         ),
//                       ),
//                       // Reviews Tab
//                       SingleChildScrollView(
//                         padding: const EdgeInsets.all(defaultPadding),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             // Rating Summary Section
//                             const Text(
//                               "5.0",
//                               style: TextStyle(
//                                 fontSize: 24,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             const SizedBox(height: defaultPadding / 2),
//                             Row(
//                               children: [
//                                 const Icon(Icons.star,
//                                     color: Colors.amber, size: 20),
//                                 const SizedBox(width: defaultPadding / 4),
//                                 Expanded(
//                                   child: LinearProgressIndicator(
//                                     value: 1.0, // 100% for 5 stars
//                                     backgroundColor: Colors.grey[300],
//                                     valueColor:
//                                         const AlwaysStoppedAnimation<Color>(
//                                             Colors.amber),
//                                   ),
//                                 ),
//                                 const SizedBox(width: defaultPadding),
//                                 const Text(
//                                   "0.0%",
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.grey,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: defaultPadding / 4),
//                             Row(
//                               children: [
//                                 const Icon(Icons.star,
//                                     color: Colors.amber, size: 20),
//                                 const SizedBox(width: defaultPadding / 4),
//                                 Expanded(
//                                   child: LinearProgressIndicator(
//                                     value: 0.0, // 0% for 4 stars
//                                     backgroundColor: Colors.grey[300],
//                                     valueColor:
//                                         const AlwaysStoppedAnimation<Color>(
//                                             Colors.amber),
//                                   ),
//                                 ),
//                                 const SizedBox(width: defaultPadding),
//                                 const Text(
//                                   "0.0%",
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.grey,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: defaultPadding / 4),
//                             Row(
//                               children: [
//                                 const Icon(Icons.star,
//                                     color: Colors.amber, size: 20),
//                                 const SizedBox(width: defaultPadding / 4),
//                                 Expanded(
//                                   child: LinearProgressIndicator(
//                                     value: 0.0, // 0% for 3 stars
//                                     backgroundColor: Colors.grey[300],
//                                     valueColor:
//                                         const AlwaysStoppedAnimation<Color>(
//                                             Colors.amber),
//                                   ),
//                                 ),
//                                 const SizedBox(width: defaultPadding),
//                                 const Text(
//                                   "0.0%",
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.grey,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: defaultPadding / 4),
//                             Row(
//                               children: [
//                                 const Icon(Icons.star,
//                                     color: Colors.amber, size: 20),
//                                 const SizedBox(width: defaultPadding / 4),
//                                 Expanded(
//                                   child: LinearProgressIndicator(
//                                     value: 0.0, // 0% for 2 stars
//                                     backgroundColor: Colors.grey[300],
//                                     valueColor:
//                                         const AlwaysStoppedAnimation<Color>(
//                                             Colors.amber),
//                                   ),
//                                 ),
//                                 const SizedBox(width: defaultPadding),
//                                 const Text(
//                                   "0.0%",
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.grey,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: defaultPadding / 4),
//                             Row(
//                               children: [
//                                 const Icon(Icons.star,
//                                     color: Colors.amber, size: 20),
//                                 const SizedBox(width: defaultPadding / 4),
//                                 Expanded(
//                                   child: LinearProgressIndicator(
//                                     value: 0.0, // 0% for 1 star
//                                     backgroundColor: Colors.grey[300],
//                                     valueColor:
//                                         const AlwaysStoppedAnimation<Color>(
//                                             Colors.amber),
//                                   ),
//                                 ),
//                                 const SizedBox(width: defaultPadding),
//                                 const Text(
//                                   "0.0%",
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.grey,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: defaultPadding),
//                             // Review List
//                             const Text(
//                               "Reviews (0)",
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             const SizedBox(height: defaultPadding),
//                             const Center(
//                               child: Text(
//                                 "No reviews yet.",
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CategoryItem extends StatelessWidget {
//   final CategoryModel category;

//   const CategoryItem({super.key, required this.category});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         if (category.image != null)
//           ClipRRect(
//             borderRadius: BorderRadius.circular(defaultBorderRadious),
//             child: Image.network(
//               category.image!,
//               width: 60, // Adjust size as needed
//               height: 60, // Adjust size as needed
//               fit: BoxFit.cover,
//             ),
//           ),
//         const SizedBox(height: defaultPadding / 2),
//         Text(
//           category.title,
//           style: const TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.bold,
//           ),
//           textAlign: TextAlign.center,
//         ),
//       ],
//     );
//   }
// }
