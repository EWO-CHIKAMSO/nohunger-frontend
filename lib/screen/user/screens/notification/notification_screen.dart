import 'package:flutter/material.dart';
import 'package:nohunger/utilities/constants.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(defaultPadding),
        itemCount: 10, // Replace with actual notification count
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Colors.blue, // Replace with desired color
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.notifications, color: Colors.white),
            ),
            title: const Text('Notification Title'),
            subtitle: const Text('Notification details...'),
            trailing: const Text('6h ago'),
          );
        },
      ),
    );
  }
}



// import 'package:client/screen/user/components/buy_full_ui_kit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';


// class NotificationsScreen extends StatelessWidget {
//   const NotificationsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text("Notifications"),
//           actions: [
//             IconButton(
//               onPressed: () {},
//               icon: SvgPicture.asset(
//                 "assets/icons/DotsV.svg",
//                 colorFilter: ColorFilter.mode(
//                   Theme.of(context).iconTheme.color!,
//                   BlendMode.srcIn,
//                 ),
//               ),
//             )
//           ],
//         ),
//         body: const BuyFullKit(
//           images: ["assets/screenshots/Notification.png"],
//         ));
//   }
// }