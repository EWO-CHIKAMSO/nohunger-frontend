import 'package:flutter/material.dart';

class VendorsScreen extends StatefulWidget {
  const VendorsScreen({Key? key}) : super(key: key);

  @override
  State<VendorsScreen> createState() => _VendorsScreenState();
}

class _VendorsScreenState extends State<VendorsScreen> {
  // Vendor data
  List<Map<String, dynamic>> vendors = [
    {
      "name": "Fresh Farms Market",
      "image": "https://via.placeholder.com/48",
      "rating": 4.8,
      "status": true,
      "category": "Groceries",
      "address": "123 Market St, San Francisco, CA",
      "phone": "+1 (415) 555-1234",
      "email": "contact@freshfarms.com"
    },
    {
      "name": "Organic Delights",
      "image": "https://via.placeholder.com/48",
      "rating": 4.6,
      "status": true,
      "category": "Organic",
      "address": "456 Natural Ave, Portland, OR",
      "phone": "+1 (503) 555-5678",
      "email": "hello@organicdelights.com"
    },
    {
      "name": "Metro Grocers",
      "image": "https://via.placeholder.com/48",
      "rating": 4.5,
      "status": true,
      "category": "Groceries",
      "address": "789 Urban Blvd, Chicago, IL",
      "phone": "+1 (312) 555-9012",
      "email": "info@metrogrocers.com"
    },
    {
      "name": "Sunshine Bakery",
      "image": "https://via.placeholder.com/48",
      "rating": 4.9,
      "status": true,
      "category": "Bakery",
      "address": "321 Sunny Lane, Miami, FL",
      "phone": "+1 (305) 555-3456",
      "email": "hello@sunshinebakery.com"
    },
    {
      "name": "Green Valley Produce",
      "image": "https://via.placeholder.com/48",
      "rating": 4.3,
      "status": false,
      "category": "Produce",
      "address": "654 Valley Road, Austin, TX",
      "phone": "+1 (512) 555-7890",
      "email": "support@greenvalley.com"
    },
    {
      "name": "Urban Pantry",
      "image": "https://via.placeholder.com/48",
      "rating": 4.7,
      "status": true,
      "category": "Groceries",
      "address": "987 Downtown St, New York, NY",
      "phone": "+1 (212) 555-2345",
      "email": "contact@urbanpantry.com"
    },
    {
      "name": "Healthy Harvest",
      "image": "https://via.placeholder.com/48",
      "rating": 4.4,
      "status": true,
      "category": "Organic",
      "address": "246 Health Blvd, Seattle, WA",
      "phone": "+1 (206) 555-6789",
      "email": "info@healthyharvest.com"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vendors'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search vendors...',
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
          Expanded(
            child: ListView.builder(
              itemCount: vendors.length,
              itemBuilder: (context, index) {
                final vendor = vendors[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 24,
                              backgroundImage: NetworkImage(vendor['image']),
                              onBackgroundImageError: (error, stackTrace) => Image.asset('assets/images/fallback.png'),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    vendor['name'],
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      const Icon(Icons.star, color: Colors.amber, size: 16),
                                      Text(
                                        vendor['rating'].toString(),
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        vendor['category'],
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Switch(
                              value: vendor['status'],
                              onChanged: (value) {
                                setState(() {
                                  vendor['status'] = value;
                                });
                              },
                              activeColor: Colors.blue,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            const Icon(Icons.location_on_outlined, size: 16, color: Colors.grey),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                vendor['address'],
                                style: const TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.phone_outlined, size: 16, color: Colors.grey),
                            const SizedBox(width: 4),
                            Text(
                              vendor['phone'],
                              style: const TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.email_outlined, size: 16, color: Colors.grey),
                            const SizedBox(width: 4),
                            Text(
                              vendor['email'],
                              style: const TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: const Text('View Details'),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                              ),
                              child: const Text('Contact'),
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
        ],
      ),
    );
  }
}