import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nohunger/route/screen_export.dart';
import 'package:nohunger/utilities/constants.dart';
import 'package:nohunger/utilities/size_config.dart';
import 'utilities/custom_appbar.dart';
import 'package:nohunger/screen/vendor/widget/login.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  final List _pages = const [
    HomeScreen(),
    WalletScreen(),
    CartScreen(),
    ProfileScreen(),
  ];
  int _currentIndex = 0;

  void showAddressBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const Text(
              'Saved Address',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: defaultPadding),
            ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  leading: const Icon(Icons.location_on),
                  title: const Text('Current Location'),
                  subtitle: const Text('123 Main Street, City'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.add),
                  title: const Text('Add New Address'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);

    return Scaffold(
      appBar: CustomAppbar(
        onAddressPress: () => showAddressBottomSheet(context),
        onSearchPress: () {
          Navigator.pushNamed(context, searchScreenRoute);
        },
        onNotificationPress: () {
          Navigator.pushNamed(context, notificationsScreenRoute);
        },
        context: context,
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
              _buildNavItem(1,Icons.account_balance_wallet_outlined, "Wallet"),
              _buildBookmarkButton(), // Center button
              _buildNavItem(2,Icons.shopping_basket_outlined, "Cart"),
              _buildNavItem(3,Icons.person_outline, "Profile"),
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
         Icon(iconPath, color: _currentIndex == index ? Colors.black : Colors.grey, size: 24),
          const SizedBox(height:2),
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
        // Navigate to another screen (e.g. BookmarkScreen)
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserLogin(onGoToSecondPage: () {  },)),
        );
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
          child: SvgPicture.asset(
            "assets/icons/user/plus-solid.svg",
            height: 24,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}



// import 'package:animations/animations.dart';
// import 'package:client/route/route_constants.dart';
// import 'package:client/screen/user/screens/bookmark/bookmark_screen.dart';
// import 'package:client/screen/user/screens/home/home_screen.dart';
// import 'package:client/screen/user/screens/profile/profile_screen.dart';
// import 'package:client/route/screen_export.dart';
// import 'package:client/utilities/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// // import 'package:shop/constants.dart';
// // import 'package:shop/route/screen_export.dart';



// class EntryPoint extends StatefulWidget {
//   const EntryPoint({super.key});

//   @override
//   State<EntryPoint> createState() => _EntryPointState();
// }

// class _EntryPointState extends State<EntryPoint> {
//   final List _pages = const [
//     HomeScreen(),
//     DiscoverScreen(),
//     BookmarkScreen(),
//     // EmptyCartScreen(), // if Cart is empty
//     CartScreen(),
//     ProfileScreen(),
//   ];
//   int _currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     SvgPicture svgIcon(String src, {Color? color}) {
//       return SvgPicture.asset(
//         src,
//         height: 24,
//         colorFilter: ColorFilter.mode(
//             color ??
//                 Theme.of(context).iconTheme.color!.withOpacity(
//                     Theme.of(context).brightness == Brightness.dark ? 0.3 : 1),
//             BlendMode.srcIn),
//       );
//     }

//     return Scaffold(
//       appBar: AppBar(
//         // pinned: true,
//         // floating: true,
//         // snap: true,
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         leading: const SizedBox(),
//         leadingWidth: 0,
//         centerTitle: false,
//         title: SvgPicture.asset(
//           "assets/logo/noHungerLogo.svg",
//           colorFilter: ColorFilter.mode(
//               Theme.of(context).iconTheme.color!, BlendMode.srcIn),
//           height: 20,
//           width: 100,
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               Navigator.pushNamed(context, searchScreenRoute);
//             },
//             icon: SvgPicture.asset(
//               "assets/icons/user/Search.svg",
//               height: 24,
//               colorFilter: ColorFilter.mode(
//                   Theme.of(context).textTheme.bodyLarge!.color!,
//                   BlendMode.srcIn),
//             ),
//           ),
//           IconButton(
//             onPressed: () {
//               Navigator.pushNamed(context, notificationsScreenRoute);
//             },
//             icon: SvgPicture.asset(
//               "assets/icons/user/Notification.svg",
//               height: 24,
//               colorFilter: ColorFilter.mode(
//                   Theme.of(context).textTheme.bodyLarge!.color!,
//                   BlendMode.srcIn),
//             ),
//           ),
//         ],
//       ),
//       // body: _pages[_currentIndex],
//       body: PageTransitionSwitcher(
//         duration: defaultDuration,
//         transitionBuilder: (child, animation, secondAnimation) {
//           return FadeThroughTransition(
//             animation: animation,
//             secondaryAnimation: secondAnimation,
//             child: child,
//           );
//         },
//         child: _pages[_currentIndex],
//       ),
//       bottomNavigationBar: Container(
//         padding: const EdgeInsets.only(top: defaultPadding / 2),
//         color: Theme.of(context).brightness == Brightness.light
//             ? Colors.white
//             : const Color(0xFF101015),
//         child: BottomNavigationBar(
//           currentIndex: _currentIndex,
//           onTap: (index) {
//             if (index != _currentIndex) {
//               setState(() {
//                 _currentIndex = index;
//               });
//             }
//           },
//           backgroundColor: Theme.of(context).brightness == Brightness.light
//               ? Colors.white
//               : const Color(0xFF101015),
//           type: BottomNavigationBarType.fixed,
//           // selectedLabelStyle: TextStyle(color: primaryColor),
//           selectedFontSize: 12,
//           selectedItemColor: primaryColor,
//           unselectedItemColor: Colors.transparent,
//           items: [
//             BottomNavigationBarItem(
//               icon: svgIcon("assets/icons/user/Shop.svg"),
//               activeIcon: svgIcon("assets/icons/user/Shop.svg", color: primaryColor),
//               label: "Shop",
//             ),
//             BottomNavigationBarItem(
//               icon: svgIcon("assets/icons/user/Category.svg"),
//               activeIcon:
//                   svgIcon("assets/icons/user/Category.svg", color: primaryColor),
//               label: "Discover",
//             ),
//             BottomNavigationBarItem(
//               icon: svgIcon("assets/icons/user/Bookmark.svg"),
//               activeIcon:
//                   svgIcon("assets/icons/user/Bookmark.svg", color: primaryColor),
//               label: "Bookmark",
//             ),
//             BottomNavigationBarItem(
//               icon: svgIcon("assets/icons/user/Bag.svg"),
//               activeIcon: svgIcon("assets/icons/user/Bag.svg", color: primaryColor),
//               label: "Cart",
//             ),
//             BottomNavigationBarItem(
//               icon: svgIcon("assets/icons/user/Profile.svg"),
//               activeIcon:
//                   svgIcon("assets/icons/user/Profile.svg", color: primaryColor),
//               label: "Profile",
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }