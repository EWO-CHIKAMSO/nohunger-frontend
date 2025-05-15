import 'package:flutter/material.dart';

class CreateOrderScreen extends StatefulWidget {
  const CreateOrderScreen({Key? key}) : super(key: key);

  @override
  State<CreateOrderScreen> createState() => _CreateOrderScreenState();
}

class _CreateOrderScreenState extends State<CreateOrderScreen> {
  final _formKey = GlobalKey<FormState>();
  String _selectedVendor = 'Fresh Farms Market';
  final List<String> _vendors = [
    'Fresh Farms Market',
    'Organic Delights',
    'Metro Grocers',
    'Sunshine Bakery',
    'Green Valley Produce'
  ];
  
  final List<Map<String, dynamic>> _cartItems = [];
  double _subtotal = 0.0;
  final double _taxRate = 0.08;
  
  // Product data
  final List<Map<String, dynamic>> _products = [
    {
      "id": "P001",
      "name": "Organic Apples",
      "price": 3.99,
      "image": "https://via.placeholder.com/50",
      "vendor": "Fresh Farms Market"
    },
    {
      "id": "P002",
      "name": "Whole Grain Bread",
      "price": 4.50,
      "image": "https://via.placeholder.com/50",
      "vendor": "Sunshine Bakery"
    },
    {
      "id": "P003",
      "name": "Free Range Eggs",
      "price": 5.99,
      "image": "https://via.placeholder.com/50",
      "vendor": "Organic Delights"
    },
    {
      "id": "P004",
      "name": "Almond Milk",
      "price": 3.49,
      "image": "https://via.placeholder.com/50",
      "vendor": "Metro Grocers"
    },
    {
      "id": "P005",
      "name": "Organic Spinach",
      "price": 2.99,
      "image": "https://via.placeholder.com/50",
      "vendor": "Green Valley Produce"
    }
  ];

  void _addToCart(Map<String, dynamic> product) {
    // Check if product already exists in cart
    int existingIndex = _cartItems.indexWhere((item) => item['id'] == product['id']);
    
    setState(() {
      if (existingIndex >= 0) {
        // Increment quantity if product already in cart
        _cartItems[existingIndex]['quantity']++;
      } else {
        // Add new product to cart
        _cartItems.add({
          'id': product['id'],
          'name': product['name'],
          'price': product['price'],
          'image': product['image'],
          'quantity': 1,
        });
      }
      _updateSubtotal();
    });
  }
  
  void _removeFromCart(int index) {
    setState(() {
      _cartItems.removeAt(index);
      _updateSubtotal();
    });
  }
  
  void _updateQuantity(int index, int quantity) {
    if (quantity <= 0) {
      _removeFromCart(index);
      return;
    }
    
    setState(() {
      _cartItems[index]['quantity'] = quantity;
      _updateSubtotal();
    });
  }
  
  void _updateSubtotal() {
    _subtotal = 0;
    for (var item in _cartItems) {
      _subtotal += item['price'] * item['quantity'];
    }
  }
  
  double get _tax => _subtotal * _taxRate;
  double get _total => _subtotal + _tax;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Order'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Order Information',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Vendor Dropdown
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Select Vendor',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.store),
                    ),
                    value: _selectedVendor,
                    items: _vendors.map((String vendor) {
                      return DropdownMenuItem<String>(
                        value: vendor,
                        child: Text(vendor),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedVendor = newValue!;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  
                  // Customer Information
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Customer Name',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter customer name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Customer Phone',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.phone),
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter customer phone';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Delivery Address',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.location_on),
                    ),
                    maxLines: 2,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter delivery address';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            
            // Products Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Add Products',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton.icon(
                    icon: const Icon(Icons.search),
                    label: const Text('Search Products'),
                    onPressed: () {
                      _showProductSearchDialog();
                    },
                  ),
                ],
              ),
            ),
            
            // Cart Items
            Expanded(
              child: _cartItems.isEmpty
                  ? const Center(
                      child: Text(
                        'No items added to order yet',
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _cartItems.length,
                      itemBuilder: (context, index) {
                        final item = _cartItems[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Image.network(
                                  item['image'],
                                  width: 50,
                                  height: 50,
                                  errorBuilder: (context, error, stackTrace) => Container(
                                    width: 50,
                                    height: 50,
                                    color: Colors.grey.shade200,
                                    child: const Icon(Icons.image, color: Colors.grey),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item['name'],
                                        style: const TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '\$${item['price'].toStringAsFixed(2)}',
                                        style: const TextStyle(color: Colors.blue),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.remove_circle_outline),
                                      onPressed: () {
                                        _updateQuantity(index, item['quantity'] - 1);
                                      },
                                    ),
                                    Text(
                                      item['quantity'].toString(),
                                      style: const TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.add_circle_outline),
                                      onPressed: () {
                                        _updateQuantity(index, item['quantity'] + 1);
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete_outline, color: Colors.red),
                                      onPressed: () {
                                        _removeFromCart(index);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
            
            // Order Summary
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Subtotal'),
                      Text('\$${_subtotal.toStringAsFixed(2)}'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tax (${(_taxRate * 100).toStringAsFixed(0)}%)'),
                      Text('\$${_tax.toStringAsFixed(2)}'),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '\$${_total.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _cartItems.isEmpty
                          ? null
                          : () {
                              if (_formKey.currentState!.validate()) {
                                // Process order
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Order created successfully')),
                                );
                                Navigator.pop(context);
                              }
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Create Order'),
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

  void _showProductSearchDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Products'),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _products.length,
            itemBuilder: (context, index) {
              final product = _products[index];
              return ListTile(
                leading: Image.network(
                  product['image'],
                  width: 40,
                  height: 40,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 40,
                    height: 40,
                    color: Colors.grey.shade200,
                    child: const Icon(Icons.image, color: Colors.grey, size: 20),
                  ),
                ),
                title: Text(product['name']),
                subtitle: Text('\$${product['price'].toStringAsFixed(2)}'),
                trailing: IconButton(
                  icon: const Icon(Icons.add_circle, color: Colors.blue),
                  onPressed: () {
                    _addToCart(product);
                    Navigator.pop(context);
                  },
                ),
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}