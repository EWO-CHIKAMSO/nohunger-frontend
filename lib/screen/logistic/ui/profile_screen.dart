 import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';



class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isOnline = true;
  String activeTab = 'weekly';

  final List<Map<String, dynamic>> recentDeliveries = [
    {
      'id': 'ORD-2506-8742',
      'date': 'June 20, 2025 • 10:35 AM',
      'customer': 'Emma Thompson',
      'location': '1234 Market Street, San Francisco',
      'amount': '\$18.50',
      'status': 'Completed',
    },
    {
      'id': 'ORD-2506-8741',
      'date': 'June 19, 2025 • 3:22 PM',
      'customer': 'Michael Chen',
      'location': '567 Pine Avenue, San Francisco',
      'amount': '\$24.75',
      'status': 'Completed',
    },
    {
      'id': 'ORD-2506-8740',
      'date': 'June 19, 2025 • 11:45 AM',
      'customer': 'Sarah Johnson',
      'location': '890 Ocean Boulevard, San Francisco',
      'amount': '\$32.20',
      'status': 'Completed',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      const CircleAvatar(
                        radius: 48,
                        backgroundImage: NetworkImage(
                            'https://readdy.ai/api/search-image?query=professional%20portrait%20photograph%20of%20a%20male%20delivery%20driver%20in%20his%2030s%2C%20wearing%20a%20delivery%20uniform%2C%20friendly%20smile%2C%20high%20quality%2C%20photorealistic%2C%20professional%20headshot%2C%20clean%20background%2C%20sharp%20focus&width=200&height=200&seq=1&orientation=squarish'),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: isOnline ? Colors.green : Colors.grey,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: Text(
                          isOnline ? 'Online' : 'Offline',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Jason Donovan',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'ID: RDR-24859',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      const SizedBox(width: 4),
                      const Text(
                        '4.92',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        isOnline ? 'Online' : 'Offline',
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(width: 8),
                      Switch(
                        value: isOnline,
                        onChanged: (value) {
                          setState(() {
                            isOnline = value;
                          });
                        },
                        activeColor: Colors.green,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Performance Statistics
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Performance Statistics',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    children: [
                      _buildStatCard(
                        icon: Icons.local_shipping,
                        value: '1,248',
                        label: 'Total Deliveries',
                        color: Colors.purple,
                      ),
                      _buildStatCard(
                        icon: Icons.attach_money,
                        value: '\$142.50',
                        label: "Today's Earnings",
                        color: Colors.green,
                      ),
                      _buildStatCard(
                        icon: Icons.timer,
                        value: '18 min',
                        label: 'Avg. Delivery Time',
                        color: Colors.blue,
                      ),
                      _buildStatCard(
                        icon: Icons.bar_chart,
                        value: '98.5%',
                        label: 'Success Rate',
                        color: Colors.orange,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Quick Actions
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Quick Actions',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 100,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildQuickAction(
                          icon: Icons.local_shipping,
                          label: 'Start Delivery',
                          color: Colors.purple,
                        ),
                        const SizedBox(width: 12),
                        _buildQuickAction(
                          icon: Icons.inventory,
                          label: 'View Orders',
                          color: Colors.blue,
                        ),
                        const SizedBox(width: 12),
                        _buildQuickAction(
                          icon: Icons.attach_money,
                          label: 'Earnings',
                          color: Colors.green,
                        ),
                        const SizedBox(width: 12),
                        _buildQuickAction(
                          icon: Icons.support,
                          label: 'Support',
                          color: Colors.orange,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Account Settings
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Account Settings',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        _buildSettingItem(
                          icon: Icons.person,
                          label: 'Personal Information',
                          color: Colors.blue,
                        ),
                        const Divider(height: 1),
                        _buildSettingItem(
                          icon: Icons.local_shipping,
                          label: 'Vehicle Details',
                          color: Colors.purple,
                        ),
                        const Divider(height: 1),
                        _buildSettingItem(
                          icon: Icons.description,
                          label: 'Documents & License',
                          color: Colors.orange,
                        ),
                        const Divider(height: 1),
                        _buildSettingItem(
                          icon: Icons.credit_card,
                          label: 'Bank Account Details',
                          color: Colors.green,
                        ),
                        const Divider(height: 1),
                        _buildSettingItem(
                          icon: Icons.settings,
                          label: 'Language Preferences',
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Performance History
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Performance History',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
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
                                'Earnings Overview',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: ToggleButtons(
                                  isSelected: [
                                    activeTab == 'weekly',
                                    activeTab == 'monthly'
                                  ],
                                  onPressed: (index) {
                                    setState(() {
                                      activeTab = index == 0 ? 'weekly' : 'monthly';
                                    });
                                  },
                                  borderRadius: BorderRadius.circular(8),
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 16),
                                      child: Text('Weekly'),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 16),
                                      child: Text('Monthly'),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: 200,
                            child: SfCartesianChart(
                              primaryXAxis: CategoryAxis(
                                labelStyle: const TextStyle(color: Colors.grey),
                                axisLine: const AxisLine(color: Colors.grey),
                              ),
                              primaryYAxis: NumericAxis(
                                labelStyle: const TextStyle(color: Colors.grey),
                                axisLine: const AxisLine(width: 0),
                                majorGridLines: const MajorGridLines(color: Colors.grey, width: 0.5),
                              ),
                              series: <CartesianSeries>[
                                ColumnSeries<ChartData, String>(
                                  dataSource: activeTab == 'weekly'
                                      ? weeklyData
                                      : monthlyData,
                                  xValueMapper: (ChartData data, _) => data.x,
                                  yValueMapper: (ChartData data, _) => data.y,
                                  color: Colors.purple,
                                  width: 0.6,
                                ),
                              ],
                              tooltipBehavior: TooltipBehavior(
                                enable: true,
                                format: '\${point.y} earned',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: const Text(
                            'Recent Deliveries',
                            style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                          ),
                        ),
                        ...recentDeliveries.map((delivery) {
                          return Column(
                            children: [
                              const Divider(height: 1),
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          delivery['id'],
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 2),
                                          decoration: BoxDecoration(
                                            color: Colors.green[50],
                                            borderRadius: BorderRadius.circular(12),
                                            border: Border.all(
                                                color: Colors.green[200]!),
                                          ),
                                          child: Text(
                                            delivery['status'],
                                            style: const TextStyle(
                                              color: Colors.green,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      delivery['date'],
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(delivery['customer']),
                                    const SizedBox(height: 4),
                                    Text(
                                      delivery['location'],
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          delivery['amount'],
                                          style: const TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {},
                                          child: const Text(
                                            'View Details',
                                            style: TextStyle(
                                              color: Colors.purple,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                        const Divider(height: 1),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'View All Deliveries',
                            style: TextStyle(color: Colors.purple),
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
      
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String value,
    required String label,
    required Color color,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
         boxShadow: [
                  BoxShadow(
                    color: color.withOpacity(0.2),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 40,
              
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
               
              ),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildQuickAction({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return SizedBox(
      width: 120,
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        elevation: 2,
        shadowColor: color.withOpacity(0.15),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.12),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: color, size: 22),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                      letterSpacing: 0.1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return ListTile(
      leading: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: color, size: 16),
      ),
      title: Text(label),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: () {},
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}

final List<ChartData> weeklyData = [
  ChartData('Mon', 120),
  ChartData('Tue', 132),
  ChartData('Wed', 101),
  ChartData('Thu', 134),
  ChartData('Fri', 90),
  ChartData('Sat', 180),
  ChartData('Sun', 210),
];

final List<ChartData> monthlyData = [
  ChartData('Jan', 320),
  ChartData('Feb', 332),
  ChartData('Mar', 301),
  ChartData('Apr', 334),
  ChartData('May', 390),
  ChartData('Jun', 330),
  ChartData('Jul', 320),
  ChartData('Aug', 301),
  ChartData('Sep', 334),
  ChartData('Oct', 390),
  ChartData('Nov', 330),
  ChartData('Dec', 320),
];