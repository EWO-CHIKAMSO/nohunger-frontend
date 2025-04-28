import 'package:flutter/material.dart';
import 'package:nohunger/utilities/constants.dart';
import 'package:nohunger/screen/user/components/product/product_card.dart';

import 'components/no_search_result.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<String> recentSearches = ['Waste Shirt', 'Grays Dress', 'Red Shoes', 'Blue Jeans'];
  List<String> filteredSearches = [];
  List<Map<String, dynamic>> searchResults = [];

  // Simulated product data
  final List<Map<String, dynamic>> allProducts = [
    {
      'image': 'https://i.imgur.com/K41Mj7C.png',
      'brandName': 'LIPSYLONDON',
      'title': 'Blue Mountain Beta',
      'price': 534.33,
      'priceAfterDiscount': 28.43,
      'discountPercent': 24,
    },
    {
      'image': 'https://i.imgur.com/K41Mj7C.png',
      'brandName': 'LIPSYLONDON',
      'title': 'Printed Sleeveless',
      'price': 17.76,
      'priceAfterDiscount': null,
      'discountPercent': null,
    },
    {
      'image': 'https://i.imgur.com/K41Mj7C.png',
      'brandName': 'LIPSYLONDON',
      'title': 'Ruffle-Sleeve',
      'price': 23.13,
      'priceAfterDiscount': null,
      'discountPercent': null,
    },
  ];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    filteredSearches = recentSearches;
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      if (_searchController.text.isEmpty) {
        // If the search query is empty, show recent searches
        filteredSearches = recentSearches;
        searchResults = [];
      } else {
        // Filter recent searches
        filteredSearches = recentSearches
            .where((search) => search.toLowerCase().contains(_searchController.text.toLowerCase()))
            .toList();

        // Simulate a real search by filtering products
        searchResults = allProducts
            .where((product) =>
                product['title'].toLowerCase().contains(_searchController.text.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // First Row: Logo and Cancel Icon
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Logo
                  Image.asset("assets/logo/logo.png", height: 40),
                  // Cancel Icon
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            // Second Row: Search Bar
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: const Icon(Icons.filter_list),
                        hintText: 'Search',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(defaultBorderRadious),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Third Row: Recent Searches and See All
            if (_searchController.text.isEmpty)
              Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Recent Searches',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigate to see all recent searches
                      },
                      child: const Text('See All'),
                    ),
                  ],
                ),
              ),
            // Fourth Row: List of Recent Searches or Filtered Searches
            if (_searchController.text.isEmpty)
              Expanded(
                child: ListView(
                  children: filteredSearches.map((search) {
                    return ListTile(
                      leading: const Icon(Icons.history),
                      title: Text(search),
                      trailing: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          setState(() {
                            recentSearches.remove(search);
                            filteredSearches.remove(search);
                          });
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
            // Search Results or No Results Screen
            if (_searchController.text.isNotEmpty)
              Expanded(
                child: searchResults.isEmpty
                    ? const NoResultsScreen() // Display NoResultsScreen if no results
                    : Column(
                        children: [
                          // Header Text
                          Padding(
                            padding: const EdgeInsets.all(defaultPadding),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Search result (${searchResults.length} items)',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          // Product Cards Grid
                          Expanded(
                            child: GridView.builder(
                              padding: const EdgeInsets.all(defaultPadding),
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: defaultPadding,
                                mainAxisSpacing: defaultPadding,
                                childAspectRatio: 0.7,
                              ),
                              itemCount: searchResults.length,
                              itemBuilder: (context, index) {
                                final product = searchResults[index];
                                return ProductCard(
                                  image: product['image'],
                                  brandName: product['brandName'],
                                  title: product['title'],
                                  price: product['price'],
                                  priceAfterDiscount: product['priceAfterDiscount'],
                                  dicountpercent: product['discountPercent'],
                                  press: () {
                                    // Handle product tap
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
              ),
          ],
        ),
      ),
    );
  }
}



// import 'package:client/screen/user/components/product/product_card.dart';
// import 'package:flutter/material.dart';
// import 'package:client/utilities/constants.dart';


// class SearchScreen extends StatefulWidget {
//   const SearchScreen({super.key});

//   @override
//   _SearchScreenState createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   final TextEditingController _searchController = TextEditingController();
//   List<String> recentSearches = ['Waste Shirt', 'Grays Dress', 'Red Shoes', 'Blue Jeans'];
//   List<String> filteredSearches = [];
//   List<Map<String, dynamic>> searchResults = [];

//   @override
//   void initState() {
//     super.initState();
//     _searchController.addListener(_onSearchChanged);
//     filteredSearches = recentSearches;
//   }

//   @override
//   void dispose() {
//     _searchController.removeListener(_onSearchChanged);
//     _searchController.dispose();
//     super.dispose();
//   }

//   void _onSearchChanged() {
//     setState(() {
//       if (_searchController.text.isEmpty) {
//         filteredSearches = recentSearches;
//         searchResults = [];
//       } else {
//         filteredSearches = recentSearches
//             .where((search) => search.toLowerCase().contains(_searchController.text.toLowerCase()))
//             .toList();
//         // Simulate search results
//         searchResults = [
//           {
//             'image': 'https://i.imgur.com/K41Mj7C.png',
//             'brandName': 'LIPSYLONDON',
//             'title': 'Blue Mountain Beta',
//             'price': 534.33,
//             'priceAfterDiscount': 28.43,
//             'discountPercent': 24,
//           },
//           {
//             'image': 'https://i.imgur.com/K41Mj7C.png',
//             'brandName': 'LIPSYLONDON',
//             'title': 'Printed Sleeveless',
//             'price': 17.76,
//             'priceAfterDiscount': null,
//             'discountPercent': null,
//           },
//           {
//             'image': 'https://i.imgur.com/K41Mj7C.png',
//             'brandName': 'LIPSYLONDON',
//             'title': 'Ruffle-Sleeve',
//             'price': 23.13,
//             'priceAfterDiscount': null,
//             'discountPercent': null,
//           },
//         ];
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             // First Row: Logo and Cancel Icon
//             Padding(
//               padding: const EdgeInsets.all(defaultPadding),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   // Logo
//                   Image.asset("assets/logo/logo.png", height: 40),
//                   // Cancel Icon
//                   IconButton(
//                     icon: const Icon(Icons.close),
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                   ),
//                 ],
//               ),
//             ),
//             // Second Row: Search Bar
//             Padding(
//               padding: const EdgeInsets.all(defaultPadding),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       controller: _searchController,
//                       decoration: InputDecoration(
//                         prefixIcon: const Icon(Icons.search),
//                         suffixIcon: const Icon(Icons.filter_list),
//                         hintText: 'Search',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(defaultBorderRadious),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             // Third Row: Recent Searches and See All
//             if (_searchController.text.isEmpty)
//               Padding(
//                 padding: const EdgeInsets.all(defaultPadding),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text(
//                       'Recent Searches',
//                       style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         // Navigate to see all recent searches
//                       },
//                       child: const Text('See All'),
//                     ),
//                   ],
//                 ),
//               ),
//             // Fourth Row: List of Recent Searches or Filtered Searches
//             if (_searchController.text.isEmpty)
//               Expanded(
//                 child: ListView(
//                   children: filteredSearches.map((search) {
//                     return ListTile(
//                       leading: const Icon(Icons.history),
//                       title: Text(search),
//                       trailing: IconButton(
//                         icon: const Icon(Icons.close),
//                         onPressed: () {
//                           setState(() {
//                             recentSearches.remove(search);
//                             filteredSearches.remove(search);
//                           });
//                         },
//                       ),
//                     );
//                   }).toList(),
//                 ),
//               ),
//             // Search Results
//             if (_searchController.text.isNotEmpty)
//               Expanded(
//                 child: Column(
//                   children: [
//                     // Header Text
//                     Padding(
//                       padding: const EdgeInsets.all(defaultPadding),
//                       child: Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           'Search result (${searchResults.length} items)',
//                           style: const TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                     // Product Cards Grid
//                     Expanded(
//                       child: GridView.builder(
//                         padding: const EdgeInsets.all(defaultPadding),
//                         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 2,
//                           crossAxisSpacing: defaultPadding,
//                           mainAxisSpacing: defaultPadding,
//                           childAspectRatio: 0.7,
//                         ),
//                         itemCount: searchResults.length,
//                         itemBuilder: (context, index) {
//                           final product = searchResults[index];
//                           return ProductCard(
//                             image: product['image'],
//                             brandName: product['brandName'],
//                             title: product['title'],
//                             price: product['price'],
//                             priceAfetDiscount: product['priceAfterDiscount'],
//                             dicountpercent: product['discountPercent'],
//                             press: () {
//                               // Handle product tap
//                             },
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }




// import 'package:flutter/material.dart';
// import 'package:client/utilities/constants.dart';

// class SearchScreen extends StatefulWidget {
//   const SearchScreen({super.key});

//   @override
//   _SearchScreenState createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   final TextEditingController _searchController = TextEditingController();
//   List<String> recentSearches = ['Waste Shirt', 'Grays Dress', 'Red Shoes', 'Blue Jeans'];
//   List<String> filteredSearches = [];

//   @override
//   void initState() {
//     super.initState();
//     _searchController.addListener(_onSearchChanged);
//     filteredSearches = recentSearches;
//   }

//   @override
//   void dispose() {
//     _searchController.removeListener(_onSearchChanged);
//     _searchController.dispose();
//     super.dispose();
//   }

//   void _onSearchChanged() {
//     setState(() {
//       if (_searchController.text.isEmpty) {
//         filteredSearches = recentSearches;
//       } else {
//         filteredSearches = recentSearches
//             .where((search) => search.toLowerCase().contains(_searchController.text.toLowerCase()))
//             .toList();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             // First Row: Logo and Cancel Icon
//             Padding(
//               padding: const EdgeInsets.all(defaultPadding),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   // Logo
//                   Image.asset('assets/logo.png', height: 40),
//                   // Cancel Icon
//                   IconButton(
//                     icon: const Icon(Icons.close),
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                   ),
//                 ],
//               ),
//             ),
//             // Second Row: Search Bar
//             Padding(
//               padding: const EdgeInsets.all(defaultPadding),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       controller: _searchController,
//                       decoration: InputDecoration(
//                         prefixIcon: const Icon(Icons.search),
//                         suffixIcon: const Icon(Icons.filter_list),
//                         hintText: 'Search',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(defaultBorderRadious),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             // Third Row: Recent Searches and See All
//             Padding(
//               padding: const EdgeInsets.all(defaultPadding),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     'Recent Searches',
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       // Navigate to see all recent searches
//                     },
//                     child: const Text('See All'),
//                   ),
//                 ],
//               ),
//             ),
//             // Fourth Row: List of Recent Searches or Filtered Searches
//             Expanded(
//               child: ListView(
//                 children: filteredSearches.map((search) {
//                   return ListTile(
//                     leading: const Icon(Icons.history),
//                     title: Text(search),
//                     trailing: IconButton(
//                       icon: const Icon(Icons.close),
//                       onPressed: () {
//                         setState(() {
//                           recentSearches.remove(search);
//                           filteredSearches.remove(search);
//                         });
//                       },
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }