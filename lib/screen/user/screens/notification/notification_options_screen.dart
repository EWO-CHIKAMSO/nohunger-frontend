import 'package:flutter/material.dart';

class NotificationOptionsScreen extends StatefulWidget {
  const NotificationOptionsScreen({super.key});

  @override
  State<NotificationOptionsScreen> createState() => _NotificationOptionsScreenState();
}

class _NotificationOptionsScreenState extends State<NotificationOptionsScreen> {
  bool allowNotification = true;
  bool discountNotifications = true;
  bool storesNotifications = false;
  bool systemNotifications = false;
  bool locationNotifications = false;
  bool paymentNotifications = false;

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
          TextButton(
            onPressed: () {
              // Handle reset logic here
              setState(() {
                allowNotification = false;
                discountNotifications = false;
                storesNotifications = false;
                systemNotifications = false;
                locationNotifications = false;
                paymentNotifications = false;
              });
            },
            child: const Text(
              'Reset',
              style: TextStyle(
                color: Color(0xFF6C5CE7), // Purple color from the design
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              _buildNotificationSwitch(
                'Allow Notification',
                '',
                allowNotification,
                (value) => setState(() => allowNotification = value),
              ),
              _buildNotificationSwitch(
                'Discount notifications',
                'At a mauris volutpat cras vitae convallis gravida.',
                discountNotifications,
                (value) => setState(() => discountNotifications = value),
              ),
              _buildNotificationSwitch(
                'Stores notifications',
                'Tincidunt integer fringilla orci in non sed.',
                storesNotifications,
                (value) => setState(() => storesNotifications = value),
              ),
              _buildNotificationSwitch(
                'System notifications',
                'Tincidunt integer fringilla orci in non sed.',
                systemNotifications,
                (value) => setState(() => systemNotifications = value),
              ),
              _buildNotificationSwitch(
                'Location notifications',
                'Tincidunt integer fringilla orci in non sed.',
                locationNotifications,
                (value) => setState(() => locationNotifications = value),
              ),
              _buildNotificationSwitch(
                'Payment notifications',
                'Facilisis facilisis velit metus ipsum, vestibulum ipsum arcu, sem lectus.',
                paymentNotifications,
                (value) => setState(() => paymentNotifications = value),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationSwitch(
    String title,
    String subtitle,
    bool value,
    ValueChanged<bool> onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    if (subtitle.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              Switch(
                value: value,
                onChanged: onChanged,
                activeColor: const Color(0xFF6C5CE7), // Purple color from the design
              ),
            ],
          ),
          const Divider(height: 24),
        ],
      ),
    );
  }
}



// import 'package:client/screen/user/components/buy_full_ui_kit.dart';
// import 'package:flutter/material.dart';


// class NotificationOptionsScreen extends StatelessWidget {
//   const NotificationOptionsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const BuyFullKit(
//         images: ["assets/screens/notification setting.png"]);
//   }
// }
