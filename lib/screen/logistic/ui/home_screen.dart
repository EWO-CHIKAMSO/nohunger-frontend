import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nohunger/screen/logistic/home_page.dart';
import 'package:nohunger/screen/logistic/ui/rider_dashboard.dart';
import 'package:nohunger/screen/logistic/ui/view_cart.dart';
import 'package:nohunger/utilities/constants.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback onGoBack;
  const HomeScreen({super.key, required this.onGoBack});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDarkMode = false;
  int _currentIndex = 0;

  final List<Widget> _pages = [
     HomePage(),
    viewCart(),
   RiderDashboardScreen()
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
      body: PageTransitionSwitcher(
        duration: defaultDuration,
        transitionBuilder: (child, animation, secondaryAnimation) {
          return FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        },
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: BottomAppBar(
        height: 66,
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

  Widget _buildNavItem(int index, IconData iconPath, String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconPath,
            color: _currentIndex == index ? Colors.black : Colors.grey,
            size: 24,
          ),
          const SizedBox(height: 2),
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
      onTap: () {
        
          Navigator.pop(context);
          print("Floating Action Button Pressed");
        },
      
      child: Container(
        height: 30,
        width: 40,
        decoration: BoxDecoration(
          color: Colors.black,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 24,
          ),
        ),
      ),
    );
  }
}