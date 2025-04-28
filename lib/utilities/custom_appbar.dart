import 'package:nohunger/route/route_constants.dart';
import 'package:nohunger/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? logo;
  final VoidCallback onAddressPress;
  final VoidCallback onNotificationPress;
  final BuildContext context;

  const CustomAppbar({
    super.key,
    this.logo,
    required this.onAddressPress,
    required this.onNotificationPress,
    required this.context,
    required Null Function() onSearchPress,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      centerTitle: false,
      automaticallyImplyLeading: false,
      toolbarHeight: _calculateAppBarHeight(),
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.only(left: defaultPadding),
        child: GestureDetector(
          onTap: onAddressPress,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Deliver to',
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).textTheme.bodySmall?.color,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Current Location',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                  ),
                  const Icon(Icons.arrow_drop_down),
                ],
              ),
            ],
          ),
        ),
      ),
      leading: logo != null 
        ? SizedBox(
            width: 110,
            child: logo,
          )
        : null,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, searchScreenRoute);
          },
          icon: svgIcon("assets/icons/user/Search.svg"),
        ),
        Padding(
          padding: const EdgeInsets.only(right: defaultPadding),
          child: IconButton(
            onPressed: onNotificationPress,
            icon: svgIcon("assets/icons/user/Notification.svg"),
          ),
        ),
      ],
    );
  }

  SvgPicture svgIcon(String src, {Color? color}) {
    return SvgPicture.asset(
      src,
      height: 24,
      colorFilter: ColorFilter.mode(
          color ??
              Theme.of(context).iconTheme.color!.withOpacity(
                  Theme.of(context).brightness == Brightness.dark ? 0.3 : 1),
          BlendMode.srcIn),
    );
  }

  double _calculateAppBarHeight() {
    return 60;
  }

  @override
  Size get preferredSize => Size.fromHeight(_calculateAppBarHeight());
}



// import 'package:client/route/route_constants.dart';
// import 'package:client/utilities/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
//   final Widget? logo;
//   final VoidCallback onAddressPress;
//   final VoidCallback onNotificationPress;
//   final BuildContext context;

//   const CustomAppbar({
//     super.key,
//     this.logo,
//     required this.onAddressPress,
//     required this.onNotificationPress,
//     required this.context, required Null Function() onSearchPress,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//       centerTitle: false,
//       automaticallyImplyLeading: false,
//       toolbarHeight: _calculateAppBarHeight(),
//       titleSpacing: 0,
//       title: Row(
//         children: [
//           SizedBox(
//             width: 110,
//             child: logo,
//           ),
//           const SizedBox(width: 8),
//           GestureDetector(
//             onTap: onAddressPress,
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(
//                       'Deliver to',
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Theme.of(context).textTheme.bodySmall?.color,
//                       ),
//                     ),
//                     Row(
//                       children: [
//                         Text(
//                           'Current Location',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                             color: Theme.of(context).textTheme.bodyLarge?.color,
//                           ),
//                         ),
//                         const Icon(Icons.arrow_drop_down),
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//       actions: [
//         IconButton(
//           onPressed: () {
//             Navigator.pushNamed(context, searchScreenRoute);
//           },
//           icon: svgIcon("assets/icons/user/Search.svg"),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(right: defaultPadding),
//           child: IconButton(
//             onPressed: onNotificationPress,
//             icon: svgIcon("assets/icons/user/Notification.svg"),
//           ),
//         ),
//       ],
//     );
//   }

//   SvgPicture svgIcon(String src, {Color? color}) {
//     return SvgPicture.asset(
//       src,
//       height: 24,
//       colorFilter: ColorFilter.mode(
//           color ??
//               Theme.of(context).iconTheme.color!.withOpacity(
//                   Theme.of(context).brightness == Brightness.dark ? 0.3 : 1),
//           BlendMode.srcIn),
//     );
//   }

//   double _calculateAppBarHeight() {
//     return 60;
//   }

//   @override
//   Size get preferredSize => Size.fromHeight(_calculateAppBarHeight());
// }