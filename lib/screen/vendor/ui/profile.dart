

import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isOnline = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      const CircleAvatar(
                        radius: 56,
                        backgroundImage: NetworkImage(
                          'https://readdy.ai/api/search-image?query=Professional%20food%20vendor%20portrait%20photo%2C%20middle-aged%20chef%20in%20white%20uniform%20smiling%20at%20camera%2C%20warm%20lighting%2C%20professional%20headshot%20style%2C%20neutral%20studio%20background%2C%20high%20quality%20professional%20photography%2C%20centered%20composition%2C%20friendly%20expression&width=120&height=120&seq=1&orientation=squarish',
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check,
                          size: 12,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Fresh Harvest Kitchen',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.verified,
                        color: Colors.blue[500],
                        size: 20,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 14,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Brooklyn, New York',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Organic Food & Groceries',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        isOnline ? 'Store Online' : 'Store Offline',
                        style: TextStyle(
                          fontSize: 14,
                          color: isOnline ? Colors.green : Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isOnline = !isOnline;
                          });
                        },
                        child: Container(
                          width: 44,
                          height: 24,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: isOnline ? Colors.green : Colors.grey[300],
                          ),
                          child: AnimatedAlign(
                            duration: const Duration(milliseconds: 200),
                            alignment: isOnline
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Container(
                              width: 16,
                              height: 16,
                              margin: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Quick Stats Bar
            Container(
              margin: const EdgeInsets.only(top: 12),
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatItem(
                    icon: Icon(
                      Icons.star,
                      color: Colors.amber[500],
                      size: 16,
                    ),
                    value: '4.8',
                    label: 'Rating',
                  ),
                  _buildStatItem(
                    value: '1,254',
                    label: 'Orders',
                  ),
                  _buildStatItem(
                    value: '28m',
                    label: 'Avg. Time',
                  ),
                  _buildStatItem(
                    value: '2023',
                    label: 'Since',
                  ),
                ],
              ),
            ),
            // Management Sections
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Store Management',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Card(
                    elevation: 1,
                    child: Column(
                      children: [
                        _buildMenuButton(
                          icon: Icon(
                            Icons.store,
                            color: Colors.blue[600],
                          ),
                          title: 'Store Settings',
                          color: Colors.blue[100],
                        ),
                        const Divider(height: 1),
                        _buildMenuButton(
                          icon: Icon(
                            Icons.restaurant,
                            color: Colors.green[600],
                          ),
                          title: 'Menu Management',
                          color: Colors.green[100],
                        ),
                        const Divider(height: 1),
                        _buildMenuButton(
                          icon: Icon(
                            Icons.history,
                            color: Colors.purple[600],
                          ),
                          title: 'Order History',
                          color: Colors.purple[100],
                        ),
                        const Divider(height: 1),
                        _buildMenuButton(
                          icon: Icon(
                            Icons.show_chart,
                            color: Colors.amber[600],
                          ),
                          title: 'Earnings & Analytics',
                          color: Colors.amber[100],
                        ),
                        const Divider(height: 1),
                        _buildMenuButton(
                          icon: Icon(
                            Icons.star,
                            color: Colors.orange[600],
                          ),
                          title: 'Reviews & Ratings',
                          color: Colors.orange[100],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Account Controls
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Account',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Card(
                    elevation: 1,
                    child: Column(
                      children: [
                        _buildMenuButton(
                          icon: Icon(
                            Icons.settings,
                            color: Colors.teal[600],
                          ),
                          title: 'Account Settings',
                          color: Colors.teal[100],
                        ),
                        const Divider(height: 1),
                        _buildMenuButton(
                          icon: Icon(
                            Icons.headset_mic,
                            color: Colors.indigo[600],
                          ),
                          title: 'Help & Support',
                          color: Colors.indigo[100],
                        ),
                        const Divider(height: 1),
                        _buildMenuButton(
                          icon: Icon(
                            Icons.logout,
                            color: Colors.red[600],
                          ),
                          title: 'Logout',
                          color: Colors.red[100],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Footer
            const Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    'App Version 2.5.3',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '© 2025 Fresh Harvest Kitchen. All rights reserved.',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 80), // Space for bottom navigation
          ],
        ),
      ),
     
    );
  }

  Widget _buildStatItem({Widget? icon, required String value, required String label}) {
    return Column(
      children: [
        if (icon != null)
          Row(
            children: [
              icon,
              const SizedBox(width: 4),
              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        else
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildMenuButton({
    required Widget icon,
    required String title,
    required Color? color,
  }) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: Center(child: icon),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(
        Icons.chevron_right,
        color: Colors.grey,
      ),
      onTap: () {},
    );
  }


}