import 'package:flutter/material.dart';

class CreatePromotionScreen extends StatefulWidget {
  const CreatePromotionScreen({Key? key}) : super(key: key);

  @override
  State<CreatePromotionScreen> createState() => _CreatePromotionScreenState();
}

class _CreatePromotionScreenState extends State<CreatePromotionScreen> {
  final _formKey = GlobalKey<FormState>();
  String _selectedType = 'Percentage';
  final List<String> _promotionTypes = ['Percentage', 'Fixed Amount', 'Buy One Get One', 'Free Shipping'];
  
  final TextEditingController _valueController = TextEditingController(text: '10');
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now().add(const Duration(days: 7));
  
  bool _isActive = true;
  bool _applyToAllProducts = false;
  
  // Selected products for promotion
  final List<Map<String, dynamic>> _selectedProducts = [];
  
  // Available products
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

  @override
  void initState() {
    super.initState();
    _startDateController.text = _formatDate(_startDate);
    _endDateController.text = _formatDate(_endDate);
  }

  @override
  void dispose() {
    _valueController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }
  
  String _formatDate(DateTime date) {
    return '${date.month}/${date.day}/${date.year}';
  }
  
  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStartDate ? _startDate : _endDate,
      firstDate: isStartDate ? DateTime.now() : _startDate,
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    
    if (picked != null) {
      setState(() {
        if (isStartDate) {
          _startDate = picked;
          _startDateController.text = _formatDate(_startDate);
          
          // Ensure end date is not before start date
          if (_endDate.isBefore(_startDate)) {
            _endDate = _startDate.add(const Duration(days: 1));
            _endDateController.text = _formatDate(_endDate);
          }
        } else {
          _endDate = picked;
          _endDateController.text = _formatDate(_endDate);
        }
      });
    }
  }
  
  void _addProduct(Map<String, dynamic> product) {
    setState(() {
      if (!_selectedProducts.any((p) => p['id'] == product['id'])) {
        _selectedProducts.add(product);
      }
    });
  }
  
  void _removeProduct(String productId) {
    setState(() {
      _selectedProducts.removeWhere((p) => p['id'] == productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('Create Promotion'),
      ),
      body: SingleChildScrollView(
      
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Promotion Details',
                style: TextStyle(
                  fontSize: 18,
                color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              
              // Promotion Name
              TextFormField(
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  labelText: 'Promotion Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.local_offer),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter promotion name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              
              // Promotion Code
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Promotion Code',
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.code),
                  hintText: 'e.g., SUMMER25',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter promotion code';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              
              // Promotion Type
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Promotion Type',
                  border: OutlineInputBorder(),
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.category),
                ),
                value: _selectedType,
                items: _promotionTypes.map((String type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedType = newValue!;
                  });
                },
              ),
              const SizedBox(height: 16),
              
              // Promotion Value
              TextFormField(
                controller: _valueController,
                decoration: InputDecoration(
                  labelText: _selectedType == 'Percentage' 
                      ? 'Discount Percentage (%)' 
                      : _selectedType == 'Fixed Amount' 
                          ? 'Discount Amount (\$)' 
                          : 'Value',
                          fillColor: Colors.white,
                  border: const OutlineInputBorder(),
                  prefixIcon: _selectedType == 'Percentage' 
                      ? const Icon(Icons.percent) 
                      : const Icon(Icons.attach_money),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a value';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  if (_selectedType == 'Percentage' && double.parse(value) > 100) {
                    return 'Percentage cannot exceed 100%';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              
              // Date Range
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _startDateController,
                      decoration: const InputDecoration(
                        labelText: 'Start Date',
                        border: OutlineInputBorder(),
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.calendar_today),
                      ),
                      readOnly: true,
                      onTap: () {
                        _selectDate(context, true);
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _endDateController,
                      decoration: const InputDecoration(
                        labelText: 'End Date',
                        border: OutlineInputBorder(),
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.calendar_today),
                      ),
                      readOnly: true,
                      onTap: () {
                        _selectDate(context, false);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              
              // Description
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Description',
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.description),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 24),
              
              // Apply to all products switch
              SwitchListTile(
                title: const Text('Apply to All Products'),
                subtitle: const Text('Toggle to apply this promotion to all products'),
                value: _applyToAllProducts,
                onChanged: (bool value) {
                  setState(() {
                    _applyToAllProducts = value;
                    if (_applyToAllProducts) {
                      _selectedProducts.clear();
                    }
                  });
                },
                secondary: const Icon(Icons.shopping_bag),
              ),
              
              if (!_applyToAllProducts) ...[
                const SizedBox(height: 16),
                const Text(
                  'Select Products',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                
                // Selected products list
                if (_selectedProducts.isNotEmpty) ...[
                  const Text(
                    'Selected Products:',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _selectedProducts.length,
                      itemBuilder: (context, index) {
                        final product = _selectedProducts[index];
                        return Container(
                          width: 150,
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Stack(
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      bottomLeft: Radius.circular(8),
                                    ),
                                    child: Image.network(
                                      product['image'],
                                      width: 40,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) => Container(
                                        width: 40,
                                        color: Colors.grey.shade200,
                                        child: const Icon(Icons.image, color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      product['name'],
                                      style: const TextStyle(fontSize: 12),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: IconButton(
                                  icon: const Icon(Icons.close, size: 16),
                                  onPressed: () {
                                    _removeProduct(product['id']);
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
                
                const SizedBox(height: 16),
                Center(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.add),
                    label: const Text('Add Products'),
                    onPressed: () {
                      _showProductSelectionDialog();
                    },
                  ),
                ),
              ],
              
              const SizedBox(height: 24),
              
              // Status Switch
              SwitchListTile(
                title: const Text('Promotion Status'),
                subtitle: Text(_isActive ? 'Active' : 'Inactive'),
                value: _isActive,
                onChanged: (bool value) {
                  setState(() {
                    _isActive = value;
                  });
                },
                secondary: Icon(
                  _isActive ? Icons.check_circle : Icons.cancel,
                  color: _isActive ? Colors.green : Colors.red,
                ),
              ),
              const SizedBox(height: 32),
              
              // Submit Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Validate product selection if not applying to all
                      if (!_applyToAllProducts && _selectedProducts.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please select at least one product')),
                        );
                        return;
                      }
                      
                      // Process data and save promotion
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Promotion created successfully')),
                      );
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Create Promotion'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showProductSelectionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Products'),
        content: SizedBox(
          width: double.maxFinite,
          height: 300,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _products.length,
            itemBuilder: (context, index) {
              final product = _products[index];
              final bool isSelected = _selectedProducts.any((p) => p['id'] == product['id']);
              
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
                trailing: isSelected
                    ? const Icon(Icons.check_circle, color: Colors.green)
                    : IconButton(
                        icon: const Icon(Icons.add_circle_outline),
                        onPressed: () {
                          _addProduct(product);
                        },
                      ),
                onTap: () {
                  if (!isSelected) {
                    _addProduct(product);
                  }
                },
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }
}