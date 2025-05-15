import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  // Product data
  final List<Map<String, dynamic>> products = [
    {
      "id": "P001",
      "name": "Organic Apples",
      "image": "https://via.placeholder.com/100",
      "price": 3.99,
      "stock": 120,
      "category": "Produce",
      "vendor": "Fresh Farms Market",
      "status": true
    },
    {
      "id": "P002",
      "name": "Whole Grain Bread",
      "image": "https://via.placeholder.com/100",
      "price": 4.50,
      "stock": 45,
      "category": "Bakery",
      "vendor": "Sunshine Bakery",
      "status": true
    },
    {
      "id": "P003",
      "name": "Free Range Eggs",
      "image": "https://via.placeholder.com/100",
      "price": 5.99,
      "stock": 60,
      "category": "Dairy",
      "vendor": "Organic Delights",
      "status": true
    },
    {
      "id": "P004",
      "name": "Almond Milk",
      "image": "https://via.placeholder.com/100",
      "price": 3.49,
      "stock": 80,
      "category": "Dairy",
      "vendor": "Metro Grocers",
      "status": true
    },
    {
      "id": "P005",
      "name": "Organic Spinach",
      "image": "https://via.placeholder.com/100",
      "price": 2.99,
      "stock": 35,
      "category": "Produce",
      "vendor": "Green Valley Produce",
      "status": true
    },
    {
      "id": "P006",
      "name": "Quinoa",
      "image": "https://via.placeholder.com/100",
      "price": 6.99,
      "stock": 50,
      "category": "Grains",
      "vendor": "Urban Pantry",
      "status": true
    },
    {
      "id": "P007",
      "name": "Avocados",
      "image": "https://via.placeholder.com/100",
      "price": 1.99,
      "stock": 75,
      "category": "Produce",
      "vendor": "Fresh Farms Market",
      "status": true
    },
    {
      "id": "P008",
      "name": "Greek Yogurt",
      "image": "https://via.placeholder.com/100",
      "price": 4.99,
      "stock": 40,
      "category": "Dairy",
      "vendor": "Healthy Harvest",
      "status": true
    }
  ];

  String selectedCategory = 'All';
  final List<String> categories = ['All', 'Produce', 'Bakery', 'Dairy', 'Grains'];

  @override
  Widget build(BuildContext context) {
    // Filter products by category if needed
    final filteredProducts = selectedCategory == 'All'
        ? products
        : products.where((product) => product['category'] == selectedCategory).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        automaticallyImplyLeading: false,
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
                      hintText: 'Search products...',
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      filled: true,
                      fillColor: const Color(0xFFF9FAFB),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                PopupMenuButton<String>(
                  icon: const Icon(Icons.filter_list),
                  onSelected: (String value) {
                    setState(() {
                      selectedCategory = value;
                    });
                  },
                  itemBuilder: (BuildContext context) {
                    return categories.map((String category) {
                      return PopupMenuItem<String>(
                        value: category,
                        child: Text(category),
                      );
                    }).toList();
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Category: $selectedCategory',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${filteredProducts.length} products',
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                        child: Image.network(
                          product['image'],
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Image.asset(
                            'assets/images/fallback.png',
                            height: 120,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product['name'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '\$${product['price'].toStringAsFixed(2)}',
                              style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(Icons.store, size: 14, color: Colors.grey),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: Text(
                                    product['vendor'],
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Stock: ${product['stock']}',
                                  style: TextStyle(
                                    color: product['stock'] < 50 ? Colors.orange : Colors.green,
                                    fontSize: 12,
                                  ),
                                ),
                                Switch(
                                  value: product['status'],
                                  onChanged: (value) {
                                    setState(() {
                                      product['status'] = value;
                                    });
                                  },
                                  activeColor: Colors.blue,
                                  scale: 0.7,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}