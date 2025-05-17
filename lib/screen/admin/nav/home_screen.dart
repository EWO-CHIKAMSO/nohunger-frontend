import 'package:flutter/material.dart';
import 'package:nohunger/screen/admin/nav/vendor_catalog.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String activeTab = 'New';
  
  // Key metrics data
  final List<Map<String, dynamic>> metrics = [
    {
      "title": "Active Vendors",
      "value": "248",
      "change": "+12%",
      "icon": Icons.store,
      "isPositive": true
    },
    {
      "title": "Today's Orders",
      "value": "186",
      "change": "+8%",
      "icon": Icons.shopping_cart,
      "isPositive": true
    },
    {
      "title": "Daily Revenue",
      "value": "\$8,459",
      "change": "+15%",
      "icon": Icons.attach_money,
      "isPositive": true
    },
    {
      "title": "Active Users",
      "value": "4.2",
      "suffix": "K",
      "change": "+5%",
      "icon": Icons.people,
      "isPositive": true
    }
  ];

  // Order data
  final List<Map<String, dynamic>> orders = [
    {
      "id": "ORD-7845",
      "vendor": "Fresh Farms Market",
      "amount": "\$124.50",
      "status": "New",
      "time": "10:32 AM"
    },
    {
      "id": "ORD-7844",
      "vendor": "Organic Delights",
      "amount": "\$78.25",
      "status": "New",
      "time": "10:15 AM"
    },
    {
      "id": "ORD-7843",
      "vendor": "Metro Grocers",
      "amount": "\$56.75",
      "status": "Processing",
      "time": "09:48 AM"
    },
    {
      "id": "ORD-7842",
      "vendor": "Sunshine Bakery",
      "amount": "\$32.40",
      "status": "Processing",
      "time": "09:30 AM"
    },
    {
      "id": "ORD-7841",
      "vendor": "Green Valley Produce",
      "amount": "\$94.20",
      "status": "Delivered",
      "time": "Yesterday"
    },
    {
      "id": "ORD-7840",
      "vendor": "Urban Pantry",
      "amount": "\$145.60",
      "status": "Delivered",
      "time": "Yesterday"
    },
    {
      "id": "ORD-7839",
      "vendor": "Healthy Harvest",
      "amount": "\$67.35",
      "status": "Cancelled",
      "time": "Yesterday"
    }
  ];

  // Vendor data
  List<Map<String, dynamic>> vendors = [
    {
      "name": "Fresh Farms Market",
      "image": "https://via.placeholder.com/48",
      "rating": 4.8,
      "status": true,
      "category": "Groceries"
    },
    {
      "name": "Organic Delights",
      "image": "https://via.placeholder.com/48",
      "rating": 4.6,
      "status": true,
      "category": "Organic"
    },
    {
      "name": "Metro Grocers",
      "image": "https://via.placeholder.com/48",
      "rating": 4.5,
      "status": true,
      "category": "Groceries"
    },
    {
      "name": "Sunshine Bakery",
      "image": "https://via.placeholder.com/48",
      "rating": 4.9,
      "status": true,
      "category": "Bakery"
    },
    {
      "name": "Green Valley Produce",
      "image": "https://via.placeholder.com/48",
      "rating": 4.3,
      "status": false,
      "category": "Produce"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 80),
      child: Column(
        children: [
          // Key Metrics
          Padding(
            padding: const EdgeInsets.all(16),
            child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.5,
              children: metrics.map((metric) {
                return Material(
                  elevation: 1,
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  metric['title'],
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '${metric['value']}${metric['suffix'] ?? ''}',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                color: metric['isPositive']
                                    ? Colors.green.shade100
                                    : Colors.red.shade100,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                metric['icon'],
                                color: metric['isPositive'] ? Colors.green : Colors.red,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          '${metric['change']} from yesterday',
                          style: TextStyle(
                            fontSize: 12,
                            color: metric['isPositive'] ? Colors.green : Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          // Order Management
          _buildOrderManagementSection(),
          // Vendor Overview
          _buildVendorOverviewSection(),
          // Revenue Analytics
          _buildRevenueAnalyticsSection(),
        ],
      ),
    );
  }

  Widget _buildOrderManagementSection() {
    final filteredOrders = orders.where((order) => order['status'] == activeTab).toList();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'Order Management',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: ['New', 'Processing', 'Delivered', 'Cancelled'].map((tab) => InkWell(
                      onTap: () {
                        setState(() {
                          activeTab = tab;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 3,
                              color: activeTab == tab ? Colors.blue : Colors.transparent,
                            ),
                          ),
                        ),
                        child: Text(
                          tab,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: activeTab == tab ? Colors.blue : Colors.grey,
                          ),
                        ),
                      ),
                    ))
                  .toList(),
            ),
          ),
          const SizedBox(height: 16),
          if (filteredOrders.isEmpty)
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'No orders found',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          else
            Column(
              children: filteredOrders.map((order) {
                Color statusColor;
                switch (order['status']) {
                  case 'New':
                    statusColor = Colors.blue;
                    break;
                  case 'Processing':
                    statusColor = Colors.orange;
                    break;
                  case 'Delivered':
                    statusColor = Colors.green;
                    break;
                  case 'Cancelled':
                    statusColor = Colors.red;
                    break;
                  default:
                    statusColor = Colors.grey;
                }

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                order['id'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                order['vendor'],
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                order['amount'],
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                order['time'],
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: statusColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              order['status'],
                              style: TextStyle(
                                fontSize: 14,
                                color: statusColor,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              if (order['status'] == 'New' || order['status'] == 'Processing')
                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.check, color: Colors.green),
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.close, color: Colors.red),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              IconButton(
                                icon: const Icon(Icons.more_vert, color: Colors.grey),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const OrdersScreen()),
              );
            },
            child: const Text(
              'View All Orders',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVendorOverviewSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'Vendor Overview',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
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
          const SizedBox(height: 16),
          Column(
            children: vendors.map((vendor) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(vendor['image']),
                          onBackgroundImageError: (error, stackTrace) => Image.asset('assets/images/fallback.png'),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              vendor['name'],
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(Icons.star, color: Colors.amber, size: 16),
                                Text(
                                  vendor['rating'].toString(),
                                  style: const TextStyle(fontSize: 12),
                                ),
                                const SizedBox(width: 4),
                                const Text('•', style: TextStyle(fontSize: 12)),
                                const SizedBox(width: 4),
                                Text(
                                  vendor['category'],
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
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
              );
            }).toList(),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const VendorsScreen()),
              );
            },
            child: const Text(
              'View All Vendors',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRevenueAnalyticsSection() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'Revenue Analytics',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(
                axisLine: const AxisLine(width: 0),
                majorGridLines: const MajorGridLines(width: 0),
                majorTickLines: const MajorTickLines(size: 0),
              ),
              primaryYAxis: NumericAxis(
                axisLine: const AxisLine(width: 0),
                majorTickLines: const MajorTickLines(size: 0),
                labelFormat: '\${value}',
              ),
              series: <CartesianSeries>[
                SplineAreaSeries<Map<String, dynamic>, String>(
                  dataSource: [
                    {'day': 'Mon', 'revenue': 5200},
                    {'day': 'Tue', 'revenue': 6800},
                    {'day': 'Wed', 'revenue': 8100},
                    {'day': 'Thu', 'revenue': 7400},
                    {'day': 'Fri', 'revenue': 9200},
                    {'day': 'Sat', 'revenue': 10500},
                    {'day': 'Sun', 'revenue': 8459},
                  ],
                  xValueMapper: (data, _) => data['day'],
                  yValueMapper: (data, _) => data['revenue'],
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue.withOpacity(0.5),
                      Colors.blue.withOpacity(0.05),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderColor: Colors.blue,
                  borderWidth: 3,
                  splineType: SplineType.cardinal,
                  cardinalSplineTension: 0.9,
                ),
              ],
              tooltipBehavior: TooltipBehavior(enable: true),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Revenue by Category',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 300,
            child: SfCircularChart(
              legend: Legend(
                isVisible: true,
                position: LegendPosition.bottom,
                overflowMode: LegendItemOverflowMode.wrap,
              ),
              series: <CircularSeries>[
                DoughnutSeries<Map<String, dynamic>, String>(
                  dataSource: [
                    {'category': 'Groceries', 'value': 42},
                    {'category': 'Organic', 'value': 28},
                    {'category': 'Bakery', 'value': 15},
                    {'category': 'Produce', 'value': 10},
                    {'category': 'Others', 'value': 5},
                  ],
                  xValueMapper: (data, _) => data['category'],
                  yValueMapper: (data, _) => data['value'],
                  radius: '70%',
                  innerRadius: '80%',
                  dataLabelSettings: const DataLabelSettings(
                    isVisible: true,
                  ),
                  pointColorMapper: (data, _) {
                    switch (data['category']) {
                      case 'Groceries':
                        return Colors.blue;
                      case 'Organic':
                        return Colors.green;
                      case 'Bakery':
                        return Colors.orange;
                      case 'Produce':
                        return Colors.purple;
                      default:
                        return Colors.grey;
                    }
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Top Performing Vendors',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          Column(
            children: vendors.take(3).map(
                  (vendor) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${vendors.indexOf(vendor) + 1}',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(width: 8),
                            CircleAvatar(
                              radius: 16,
                              backgroundImage: NetworkImage(vendor['image']),
                              onBackgroundImageError: (error, stackTrace) => Image.asset('assets/images/fallback.png'),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              vendor['name'],
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black87,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '\$${(1000 + vendors.indexOf(vendor) * 500).toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Text(
                              'This month',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ).toList(),
          ),
        ],
      ),
    );
  }
}

// Import for the "View All Orders" button
class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: const Center(
        child: Text('Orders Screen'),
      ),
    );
  }
}