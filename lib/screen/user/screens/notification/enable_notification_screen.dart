import 'package:nohunger/route/route_constants.dart';
import 'package:nohunger/screen/user/screens/checkout/components/cart_custom_button.dart';
import 'package:flutter/material.dart';

class EnableNotificationScreen extends StatelessWidget {
  const EnableNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Notifications',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Image section
                    Image(
                      image: AssetImage(
                          'assets/illustrations/TurnOnNotification_lightTheme.png'),
                      height: 200,
                    ),
                    SizedBox(height: 32),
                    // Text content section
                    Text(
                      'Push Notifications \nare currently turned off',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Enabling push notifications allows us to send you info about our new products, sales, events and more!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              // Bottom button
              CartCustomButton(
                onPressed: () {
                  Navigator.pushNamed(context, notificationOptionsScreenRoute);
                },
                buttonText: 'Enable Notification',
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// import 'package:client/screen/user/components/buy_full_ui_kit.dart';
// import 'package:flutter/material.dart';


// class EnableNotificationScreen extends StatelessWidget {
//   const EnableNotificationScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const BuyFullKit(
//       images: ["assets/screenshots/Enable notification.png"],
//     );
//   }
// }
