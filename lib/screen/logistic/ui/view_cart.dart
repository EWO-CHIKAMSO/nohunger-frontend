import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class viewCart extends StatefulWidget {
  const viewCart({super.key});

  @override
  State<viewCart> createState() => _viewCartState();
}

class _viewCartState extends State<viewCart> {
  String _activeCategory = 'All';
  String _searchQuery = '';
  int _currentBanner = 0;
  int _selectedIndex = 0;

  final List<Map<String, String>> _categories = [
    {'id': 'all', 'name': 'All'},
    {'id': 'grocery', 'name': 'Grocery'},
    {'id': 'restaurant', 'name': 'Restaurant'},
    {'id': 'pharmacy', 'name': 'Pharmacy'},
    {'id': 'bakery', 'name': 'Bakery'},
    {'id': 'electronics', 'name': 'Electronics'},
    {'id': 'fashion', 'name': 'Fashion'},
  ];
  final List<Map<String, dynamic>> _banners = [
    {
      'id': 1,
      'title': 'Summer Sale',
      'description': 'Up to 50% off on fresh produce',
      'imageUrl':
          'https://images.unsplash.com/photo-1542838132-92c53300491e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=335&h=150',
    },
    {
      'id': 2,
      'title': 'Free Delivery',
      'description': 'On your first 3 orders',
      'imageUrl':
          'https://images.unsplash.com/photo-1526367790999-0150786686a2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=335&h=150',
    },
    {
      'id': 3,
      'title': 'Healthy Choices',
      'description': '20% off on organic products',
      'imageUrl':
          'https://images.unsplash.com/photo-1498837167922-ddd27525d352?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=335&h=150',
    },
  ];

  final List<Map<String, dynamic>> _vendors = [
    {
      'id': 1,
      'name': 'Fresh Harvest Market',
      'logo':
          'https://images.unsplash.com/photo-1542838132-92c53300491e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=60&h=60',
      'category': 'Grocery',
      'rating': 4.8,
      'reviews': 324,
      'deliveryTime': '15-25',
      'minOrder': 15,
      'featured': true,
    },
    {
      'id': 2,
      'name': 'Bella Italia',
      'logo':
          'https://images.unsplash.com/photo-1555396273-367ea4eb4db5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=60&h=60',
      'category': 'Restaurant',
      'rating': 4.6,
      'reviews': 512,
      'deliveryTime': '25-35',
      'minOrder': 20,
      'featured': false,
    },
    {
      'id': 3,
      'name': 'QuickMeds Pharmacy',
      'logo':
          'https://images.unsplash.com/photo-1587854692152-cbe660dbde88?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=60&h=60',
      'category': 'Pharmacy',
      'rating': 4.9,
      'reviews': 189,
      'deliveryTime': '20-30',
      'minOrder': 10,
      'featured': true,
    },
    {
      'id': 4,
      'name': 'Sweet Delights Bakery',
      'logo':
          'https://images.unsplash.com/photo-1555507036-ab1f4038808a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=60&h=60',
      'category': 'Bakery',
      'rating': 4.7,
      'reviews': 276,
      'deliveryTime': '20-35',
      'minOrder': 12,
      'featured': false,
    },
    {
      'id': 5,
      'name': 'Tech Haven',
      'logo':
          'https://images.unsplash.com/photo-1550009158-9ebf69173e03?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=60&h=60',
      'category': 'Electronics',
      'rating': 4.5,
      'reviews': 198,
      'deliveryTime': '30-45',
      'minOrder': 50,
      'featured': true,
    },
    {
      'id': 6,
      'name': 'Fashion Forward',
      'logo':
          'https://images.unsplash.com/photo-1445205170230-053b83016050?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=60&h=60',
      'category': 'Fashion',
      'rating': 4.4,
      'reviews': 156,
      'deliveryTime': '25-40',
      'minOrder': 30,
      'featured': false,
    },
  ];

  List<Map<String, dynamic>> get _filteredVendors {
    return _vendors.where((vendor) {
      final matchesCategory = _activeCategory == 'All' || vendor['category'] == _activeCategory;
      final matchesSearch = vendor['name'].toString().toLowerCase().contains(_searchQuery.toLowerCase()) ||
          vendor['category'].toString().toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
   
    body: CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _categories.map((category) {
                    final isActive = _activeCategory == category['name'];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            _activeCategory = category['name']!;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: isActive ? Colors.white : const Color(0xFF374151),
                          backgroundColor: isActive ? const Color(0xFF4F46E5) : const Color(0xFFF3F4F6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        ),
                        child: Text(
                          category['name']!,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 150,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentBanner = index;
                  });
                },
              ),
              items: _banners.map((banner) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    banner['imageUrl'],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_banners.length, (i) {
                  return Container(
                    width: 6,
                    height: 6,
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentBanner == i ? Colors.white : Colors.white.withOpacity(0.5),
                    ),
                  );
                }),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(
                'Available Stores',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF1F2937)),
              ),
            ),
          ),
          _filteredVendors.isEmpty
              ? SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.storefront,
                          size: 60,
                          color: Color(0xFFD1D5DB),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'No stores found',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Color(0xFF374151)),
                        ),
                        const SizedBox(height: 8),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'We couldn\'t find any stores matching your search. Try different keywords or browse all categories.',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Color(0xFF6B7280)),
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _searchQuery = '';
                              _activeCategory = 'All';
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4F46E5),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          ),
                          child: const Text('Clear Filters'),
                        ),
                      ],
                    ),
                  ),
                )
              : SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final vendor = _filteredVendors[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child:Container(
                          // elevation: 1,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(12),
                           color: Colors.white,
                           boxShadow: [
                             BoxShadow(
                               color: Colors.grey.withOpacity(0.2),
                               spreadRadius: 1,
                               blurRadius: 1,
                               offset: const Offset(0, 1),
                             ),
                           ],
                         ),
                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(12),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      vendor['logo'],
                                      width: 64,
                                      height: 64,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              vendor['name'],
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xFF1F2937),
                                              ),
                                            ),
                                            if (vendor['featured'])
                                              Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                                decoration: BoxDecoration(
                                                  color: const Color(0xFFEEF7FF),
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: const Text(
                                                  'Featured',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Color(0xFF4F46E5),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.store,
                                              size: 14,
                                              color: Color(0xFF6B7280),
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              vendor['category'],
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: Color(0xFF6B7280),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              ),
                                              Text(vendor['rating'].toString(), style: const TextStyle(fontSize: 14, color: Color(0xFF374151))),
                                              ],
                                           
                                              
                                             
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              '${vendor['rating']}',
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF374151),
                                              ),
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              '(${vendor['reviews']})',
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: Color(0xFF6B7280),
                                              ),
                                            ),
                                            const SizedBox(width: 12),
                                            const Icon(
                                              Icons.access_time,
                                              size: 14,
                                              color: Color(0xFF6B7280),
                                            ),
                                            const SizedBox(width: 4),
                                           
                                         
                                            const Icon(
                                              Icons.shopping_basket,
                                              size: 14,
                                              color: Color(0xFF6B7280),
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              'Min \$${vendor['minOrder']}',
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: Color(0xFF6B7280),
                                              ),
                                            ),
                                          ],
                                        ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
                    },
                    childCount: _filteredVendors.length,
                  ),
                
        
      ),
   ]) );
  }
}