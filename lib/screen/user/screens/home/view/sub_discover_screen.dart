// import 'package:client/screen/user/components/product/custom_product_card.dart';
import 'package:nohunger/route/screen_export.dart';
import 'package:nohunger/screen/user/components/product/product_card.dart';
import 'package:nohunger/screen/user/models/product_model.dart';
import 'package:flutter/material.dart';

class SubDiscoverScreen extends StatefulWidget {
  final String subCategoryName;

  const SubDiscoverScreen({super.key, required this.subCategoryName});

  @override
  _SubDiscoverScreenState createState() => _SubDiscoverScreenState();
}

class _SubDiscoverScreenState extends State<SubDiscoverScreen> {
  String selectedTab = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(widget.subCategoryName),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to cart screen
            },
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // Open filter options
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search your product here!',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    // Open menu options
                  },
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildTab('All', context),
                _buildTab('Snacks & Beverages', context),
                _buildTab('Cereals', context),
                _buildTab('Crackers', context),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Two cards per row
                crossAxisSpacing: 16.0, // Spacing between columns
                mainAxisSpacing: 16.0, // Spacing between rows
                childAspectRatio: 0.7, // Adjusted aspect ratio to fit the card dimensions
              ),
              itemCount: 6, // Replace with actual item count
              itemBuilder: (context, index) {
              return ProductCard(
                image: demoPopularProducts[index].image,
                brandName: demoPopularProducts[index].brandName,
                title: demoPopularProducts[index].title,
                price: demoPopularProducts[index].price,
                priceAfterDiscount: demoPopularProducts[index].priceAfterDiscount,
                dicountpercent: demoPopularProducts[index].dicountpercent,
                press: () {
                  Navigator.pushNamed(context, productDetailsScreenRoute);
                },
              );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String title, BuildContext context) {
    bool isSelected = selectedTab == title;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedTab = title;
          });
          // Handle tab switch
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          decoration: BoxDecoration(
            border: Border.all(color: isSelected ? Colors.blue : Colors.grey),
            borderRadius: BorderRadius.circular(8),
            color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.transparent,
          ),
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.blue : Colors.grey,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}


// import 'package:client/route/screen_export.dart';
// import 'package:client/screen/user/components/product/custom_product_card.dart';
// import 'package:flutter/material.dart';

// class SubDiscoverScreen extends StatelessWidget {
//   final String subCategoryName;

//   const SubDiscoverScreen({super.key, required this.subCategoryName});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: Text(subCategoryName),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.shopping_cart),
//             onPressed: () {
//               // Navigate to cart screen
//             },
//           ),
//           IconButton(
//             icon: const Icon(Icons.filter_list),
//             onPressed: () {
//               // Open filter options
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     decoration: InputDecoration(
//                       hintText: 'Search your product here!',
//                       prefixIcon: const Icon(Icons.search),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 IconButton(
//                   icon: const Icon(Icons.menu),
//                   onPressed: () {
//                     // Open menu options
//                   },
//                 ),
//               ],
//             ),
//           ),
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               children: [
//                 _buildTab('All', context),
//                 _buildTab('Snacks & Beverages', context),
//               ],
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: 10, // Replace with actual item count
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(
//                       vertical: 8.0, horizontal: 16.0),
//                   child: CustomProductCard(
//                     image: 'https://via.placeholder.com/150',
//                     title: 'Product $index',
//                     rating: 5.0,
//                     soldCount: 0,
//                     price: 17.0,
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTab(String title, BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//       child: GestureDetector(
//         onTap: () {
//           // Handle tab switch
//         },
//         child: Container(
//           padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.blue),
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Text(
//             title,
//             style: const TextStyle(color: Colors.blue),
//           ),
//         ),
//       ),
//     );
//   }
// }
