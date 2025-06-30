import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nohunger/screen/logistic/home_page.dart';
import 'package:nohunger/screen/logistic/ui/profile_screen.dart';
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
 final String riderName = "Michael Johnson";
  final List<Widget> _pages = [
     HomePage(),
    viewCart(),
   RiderDashboardScreen(),
   ProfileScreen()
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Container(
          
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(16, 32, 16, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 20,
                          backgroundImage: CachedNetworkImageProvider(
                            'https://readdy.ai/api/search-image?query=professional%20portrait%20photo%20of%20a%20young%20male%20delivery%20rider%20with%20a%20friendly%20smile%2C%20wearing%20a%20delivery%20uniform%20cap%2C%20high%20quality%20professional%20headshot%2C%20isolated%20on%20light%20gray%20background%2C%20centered%20composition&width=100&height=100&seq=1&orientation=squarish',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              riderName,
                              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            const Text(
                              'Rider ID: #R78945',
                              style: TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.notifications_outlined),
                          color: Colors.grey,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.settings_outlined),
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
        ),
      ),
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
              _buildNavItem(1, Icons.store, "Vendor"),
              _buildBookmarkButton(), 
              _buildNavItem(2, Icons.account_balance_wallet_outlined, "wallet"),
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