import 'package:flutter/material.dart';
import 'package:nohunger/screen/vendor/ui/dashboard.dart';
import 'package:nohunger/screen/vendor/ui/orders_screen.dart';
import 'package:nohunger/screen/vendor/ui/profile.dart';
import 'package:nohunger/screen/vendor/ui/wallet.dart';



class BottomNav extends StatefulWidget {
  final VoidCallback onGoToSecondPage;

  const BottomNav({Key? key, required this.onGoToSecondPage}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
  late List<Widget> _pages; // 👈 make it late and initialize in initState()

  @override
  void initState() {
    super.initState();
    _pages = [
      EcommerceDashboard(onGoToSecondPage: widget.onGoToSecondPage),
      const OrdersPage(),
      const Wallet(),
      const ProfilePage(),
    ];
  }

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: _buildBottomNavigationBar(_selectedIndex, _onTabTapped),
    );
  }

  Widget _buildBottomNavigationBar(int selectedIndex, Function(int) onTap) {
    final List<Map<String, dynamic>> navItems = [
      {'icon': Icons.grid_view, 'label': 'Dashboard'},
      {'icon': Icons.shopping_basket_outlined, 'label': 'Orders'},
      {'icon': Icons.account_balance_wallet_outlined, 'label': 'Wallet'},
      {'icon': Icons.person_outline, 'label': 'Profile'},
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(navItems.length, (index) {
          final item = navItems[index];
          final isActive = selectedIndex == index;
          return GestureDetector(
            onTap: () => onTap(index),
            child: _buildNavItem(
              item['icon'],
              item['label'],
              isActive,
            ),
          );
        }),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? Colors.pink[50] : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: isActive ? Colors.pink[400] : Colors.grey[400],
            size: 22,
          ),
          if (isActive) ...[
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                color: Colors.pink[400],
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
