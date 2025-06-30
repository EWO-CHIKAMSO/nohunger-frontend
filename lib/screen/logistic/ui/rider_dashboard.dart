import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';

class RiderDashboardScreen extends StatefulWidget {
  const RiderDashboardScreen({super.key});

  @override
  State<RiderDashboardScreen> createState() => _RiderDashboardScreenState();
}

class _RiderDashboardScreenState extends State<RiderDashboardScreen> {
  final String currentDate = "June 19, 2025";
  final String riderName = "Michael Johnson";
  final String availableBalance = "\$1,248.35";

  final List<Map<String, dynamic>> earningsSummary = [
    {"period": "Today", "amount": "\$78.50", "change": "+12%", "isPositive": true},
    {"period": "This Week", "amount": "\$412.75", "change": "+8%", "isPositive": true},
    {"period": "This Month", "amount": "\$1,845.20", "change": "-3%", "isPositive": false},
  ];

  final List<Map<String, dynamic>> transactions = [
    {
      "id": 1,
      "name": "FoodExpress Delivery",
      "type": "credit",
      "amount": "+\$12.50",
      "date": "Today, 2:45 PM",
      "status": "completed",
      "icon": Icons.fastfood,
    },
    {
      "id": 2,
      "name": "QuickMart Delivery",
      "type": "credit",
      "amount": "+\$18.75",
      "date": "Today, 11:20 AM",
      "status": "completed",
      "icon": Icons.shopping_bag,
    },
    {
      "id": 3,
      "name": "Withdrawal to Bank",
      "type": "debit",
      "amount": "-\$150.00",
      "date": "Yesterday, 5:30 PM",
      "status": "completed",
      "icon": Icons.account_balance,
    },
    {
      "id": 4,
      "name": "PharmaDirect Delivery",
      "type": "credit",
      "amount": "+\$9.25",
      "date": "Yesterday, 2:15 PM",
      "status": "completed",
      "icon": Icons.medical_services,
    },
    {
      "id": 5,
      "name": "Fuel Reimbursement",
      "type": "credit",
      "amount": "+\$25.00",
      "date": "Jun 17, 10:45 AM",
      "status": "pending",
      "icon": Icons.local_gas_station,
    },
    {
      "id": 6,
      "name": "Service Fee",
      "type": "debit",
      "amount": "-\$5.50",
      "date": "Jun 16, 9:30 AM",
      "status": "completed",
      "icon": Icons.percent,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Main content
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 0, bottom: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Balance Card
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: const Offset(2, 4),
                      ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Available Balance',
                                style: TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                              Text(
                                currentDate,
                                style: const TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Text(
                              availableBalance,
                              style: const TextStyle(
                                fontSize: 24,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              ),
                              const SizedBox(width: 4),
                              Chip(
                              label: const Text('Active', style: TextStyle(fontSize: 12)),
                              backgroundColor: Colors.white,
                              labelStyle: const TextStyle(color: Colors.green),
                              side: const BorderSide(color: Colors.green),
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(Icons.account_balance),
                                  label: const Text('Withdraw'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: OutlinedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(Icons.history),
                                  label: const Text('History'),
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    side: const BorderSide(color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Earnings Summary
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Earnings Summary',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color:Colors.black),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text('View Report',style: TextStyle(color:Colors.black),),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: earningsSummary.map((item) {
                            return Container(
                              width: 150,
                              margin: const EdgeInsets.only(right: 12),
                              child: Container(
                                decoration: BoxDecoration(
                                  color:Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                     color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 8,
                         offset: Offset.zero,
                                    )
                                  ]
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            item['period'],
                                            style: const TextStyle(fontSize: 11, color: Colors.grey),
                                          ),
                                          Chip(
                                            label: Row(
                                              children: [
                                                Icon(
                                                  item['isPositive']
                                                      ? Icons.arrow_upward
                                                      : Icons.arrow_downward,
                                                  size: 12,
                                                  color: item['isPositive'] ? Colors.green : Colors.red,
                                                ),
                                                const SizedBox(width: 4),
                                                Text(item['change']),
                                              ],
                                            ),
                                            backgroundColor:
                                                 Colors.white.withOpacity(0.1),
                                                
                                            labelStyle: TextStyle(
                                              color: item['isPositive'] ? Colors.green : Colors.red,
                                              fontSize: 12,
                                            ),
                                            padding: EdgeInsets.zero,
                                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        item['amount'],
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                // Quick Actions
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Quick Actions',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: Colors.black),
                      ),
                      const SizedBox(height: 8),
                      GridView.count(
                        crossAxisCount: 4,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        children: [
                          {'icon': Icons.account_balance, 'label': 'Withdraw'},
                          {'icon': Icons.add_circle, 'label': 'Add Money'},
                          {'icon': Icons.swap_horiz, 'label': 'Transfer'},
                          {'icon': Icons.description, 'label': 'Statement'},
                        ].map((action) {
                          return GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset.zero,
                                    spreadRadius: 2,
                                     blurRadius: 8,
                                    blurStyle: BlurStyle.normal,
                                    color: Colors.grey.withOpacity(0.1)
                                  )
                                ]
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.blue.withOpacity(0.1),
                                    child: Icon(action['icon'] as IconData, color: Colors.blue),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    action['label'] as String,
                                    style: const TextStyle(fontSize: 12),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                // Recent Transactions
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Recent Transactions',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: Colors.black),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text('See All',style:TextStyle (color: Colors.black)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      DefaultTabController(
                        length: 4,
                        child: Column(
                          children: [
                            const TabBar(
                              labelColor: Colors.blue,
                              unselectedLabelColor: Colors.black,
                              indicatorColor: Colors.blue,
                              tabs: [
                                Tab(text: 'All',),
                                Tab(text: 'Credits'),
                                Tab(text: 'Debits'),
                                Tab(text: 'Pending'),
                              ],
                            ),
                            SizedBox(
                              height: 400,
                              child: TabBarView(
                                children: [
                                  // All Transactions
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: transactions.length,
                                    itemBuilder: (context, index) =>
                                        TransactionCard(transaction: transactions[index]),
                                  ),
                                  // Credits
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: transactions.where((t) => t['type'] == 'credit').length,
                                    itemBuilder: (context, index) => TransactionCard(
                                      transaction: transactions
                                          .where((t) => t['type'] == 'credit')
                                          .toList()[index],
                                    ),
                                  ),
                                  // Debits
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: transactions.where((t) => t['type'] == 'debit').length,
                                    itemBuilder: (context, index) => TransactionCard(
                                      transaction: transactions
                                          .where((t) => t['type'] == 'debit')
                                          .toList()[index],
                                    ),
                                  ),
                                  // Pending
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: transactions.where((t) => t['status'] == 'pending').length,
                                    itemBuilder: (context, index) => TransactionCard(
                                      transaction: transactions
                                          .where((t) => t['status'] == 'pending')
                                          .toList()[index],
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
          ),
          // Header
          
          // Floating Action Button
          Positioned(
            bottom: 80,
            right: 16,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.blue,
              child: const Icon(Icons.attach_money, color: Colors.white),
            ),
          ),
      
        ],
      ),
    );
  }
}

class TransactionCard extends StatelessWidget {
  final Map<String, dynamic> transaction;

  const TransactionCard({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: transaction['type'] == 'credit'
                  ? Colors.green.withOpacity(0.1)
                  : Colors.red.withOpacity(0.1),
              child: Icon(
                transaction['icon'] as IconData,
                color: transaction['type'] == 'credit' ? Colors.green : Colors.red,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        transaction['name'],
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: Colors.black),
                      ),
                      Text(
                        transaction['amount'],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: transaction['type'] == 'credit' ? Colors.green : Colors.red,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        transaction['date'],
                        style: const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      Chip(
                        label: Text(
                          transaction['status'].toString().capitalize(),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: transaction['status'] == 'completed'
                            ? Colors.green
                            : transaction['status'] == 'pending'
                                ? Colors.yellow.shade800
                                : Colors.red,
                            
                        side: BorderSide(
                          color: transaction['status'] == 'completed'
                              ? Colors.green
                              : transaction['status'] == 'pending'
                                  ? Colors.yellow.shade800
                                  : Colors.red,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ],
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

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}