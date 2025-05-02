import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:nohunger/screen/vendor/ui/notification.dart';
import 'package:nohunger/screen/vendor/ui/order_overview.dart';
import 'package:nohunger/screen/vendor/ui/orders_screen.dart';
import 'package:nohunger/screen/vendor/ui/profile.dart';
import 'package:nohunger/screen/vendor/ui/wallet.dart';

class EcommerceDashboard extends StatefulWidget {
  final VoidCallback onGoToSecondPage;

  const EcommerceDashboard({
    Key? key,
    required this.onGoToSecondPage,
  }) : super(key: key);

  @override
  State<EcommerceDashboard> createState() => _EcommerceDashboardState();
}

class _EcommerceDashboardState extends State<EcommerceDashboard> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const _DashboardContent(),
    const Wallet(),
    const OrdersPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.pink[600],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.shopping_bag,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Ready\neCommerce',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              const Icon(
                Icons.calendar_today_outlined,
                size: 18,
                color: Colors.grey,
              ),
              IconButton(
                icon: const Icon(Icons.notifications_none_outlined,color: Colors.grey,),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  NotificationsPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomAppBar(
        height: 70,
        shape: const CircularNotchedRectangle(),
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : const Color(0xFF101015),
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(0, Icons.grid_view, "Home"),
              _buildNavItem(1, Icons.account_balance_wallet_outlined, "Wallet"),
              _buildBookmarkButton(),
              _buildNavItem(2, Icons.shopping_basket_outlined, "Cart"),
              _buildNavItem(3, Icons.person_outline, "Profile"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: _currentIndex == index ? Colors.black : Colors.grey,
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: _currentIndex == index ? Colors.black : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBookmarkButton() {
    return GestureDetector(
      onTap: widget.onGoToSecondPage,
      child: Container(
        height: 30,
        width: 40,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: SvgPicture.asset(
            "assets/icons/user/down_arrow.svg",
            height: 24,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class _DashboardContent extends StatelessWidget {
  const _DashboardContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildOrderOverview(context),
          _buildSalesInfo(),
          const SizedBox(height: 16),
          const SalesStatisticsCard(),
        ],
      ),
    );
  }

  Widget _buildOrderOverview(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'ORDER OVERVIEW',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const OrderOverView()),
                ),
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.purple[400],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildOrderCard(
                  '4',
                  'Pending Orders',
                  const Color(0xFFFEEDDD),
                  Colors.orange[300]!,
                  Icons.hourglass_empty,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildOrderCard(
                  '1',
                  'Today\'s Orders',
                  const Color(0xFFE8F7F8),
                  Colors.teal[300]!,
                  Icons.receipt,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildOrderCard(
                  '0',
                  'To Pickup',
                  const Color(0xFFF0E9FF),
                  Colors.purple[400]!,
                  Icons.inventory,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildOrderCard(
                  '1',
                  'To Delivery',
                  const Color(0xFFE4F2FF),
                  Colors.blue[400]!,
                  Icons.local_shipping_outlined,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOrderCard(
    String count,
    String title,
    Color bgColor,
    Color iconColor,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                count,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 18,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSalesInfo() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                const Text(
                  '\$0.00',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Withdrawable Amount',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 1,
            height: 40,
            color: Colors.grey[700],
          ),
          Expanded(
            child: Column(
              children: [
                const Text(
                  '\$0.00',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Sales This Month',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SalesStatisticsCard extends StatefulWidget {
  const SalesStatisticsCard({Key? key}) : super(key: key);

  @override
  State<SalesStatisticsCard> createState() => _SalesStatisticsCardState();
}

class _SalesStatisticsCardState extends State<SalesStatisticsCard> {
  String selectedPeriod = 'This Year';
  final List<double> monthlySales = [
    2200, 2800, 1900, 3100, 2600, 3000,
    0, 0, 0, 0, 0, 0
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,),
      child: Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
          'Sales Statistics',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
            ),
            _buildPeriodDropdown(),
          ],
        ),
        const SizedBox(height: 24),
        SizedBox(
          height: 200,
          child: LineChart(
            LineChartData(
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: 900,
            getDrawingHorizontalLine: (value) => FlLine(
              color: Colors.grey.shade200,
              strokeWidth: 1,
              dashArray: const [5, 5],
            ),
          ),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: (value, meta) {
              final index = value.toInt();
              String text = '';
              if (index >= 0 && index < 12) {
                text = DateFormat('MMM').format(DateTime(2025, index + 1));
              }
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
              text,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 12,
              ),
                ),
              );
            },
              ),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            leftTitles: AxisTitles(
  sideTitles: SideTitles(
    showTitles: true,
    interval: 1000,
    reservedSize: 25, 
    getTitlesWidget: (value, meta) {
      String text = '';
      if (value % 1000 == 0) {
        text = '${(value ~/ 1000)}k';
      }
      return Padding(
        padding: const EdgeInsets.only(left: 4.0), // Optional: tweak this too
        child: Text(
          text,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 12,
          ),
          textAlign: TextAlign.left,
        ),
      );
    },
  ),
),

          ),
          borderData: FlBorderData(show: false),
          minX: 0,
          maxX: monthlySales.length - 1,
          minY: 0,
          maxY: monthlySales.reduce((a, b) => a > b ? a : b) + 500,
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              getTooltipItems: (touchedBarSpots) => touchedBarSpots.map((barSpot) {
            final index = barSpot.x.toInt();
            final month = DateFormat('MMM').format(DateTime(2025, index + 1));
            return LineTooltipItem(
              '$month: \$${barSpot.y.toInt()}',
              const TextStyle(color: Colors.white),
            );
              }).toList(),
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: List.generate(monthlySales.length, (index) {
            return FlSpot(index.toDouble(), monthlySales[index]);
              }),
              isCurved: true,
              color: Colors.blue,
              barWidth: 3,
              isStrokeCapRound: true,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
            show: true,
            color: Colors.blue.withOpacity(0.1),
              ),
            ),
          ],
            ),
          ),
        ),
          ],
        ),
      ),
        ));
  }

  Widget _buildPeriodDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedPeriod,
          icon: const Icon(Icons.keyboard_arrow_down),
          isDense: true,
          items: const [
            DropdownMenuItem(
              value: 'This Year',
              child: Text('This Year'),
            ),
            DropdownMenuItem(
              value: 'Last Year',
              child: Text('Last Year'),
            ),
            DropdownMenuItem(
              value: 'Last 6 Months',
              child: Text('Last 6 Months'),
            ),
          ],
          onChanged: (String? newValue) {
            if (newValue != null) {
              setState(() => selectedPeriod = newValue);
            }
          },
        ),
      ),
    );
  }
}