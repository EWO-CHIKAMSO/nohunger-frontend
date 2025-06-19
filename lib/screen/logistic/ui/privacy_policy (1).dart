import 'package:flutter/material.dart';

class PrivacySecurityScreen extends StatefulWidget {
  const PrivacySecurityScreen({super.key});

  @override
  State<PrivacySecurityScreen> createState() => _PrivacySecurityScreenState();
}

class _PrivacySecurityScreenState extends State<PrivacySecurityScreen> {
  bool twoFactorEnabled = true;
  bool dataSharing = false;
  bool profileVisibility = true;

  final List<Map<String, dynamic>> devices = [
    {
      'type': 'iPhone 13',
      'location': 'New York, USA',
      'lastActive': 'Now (Current device)',
      'icon': Icons.phone_iphone
    },
    {
      'type': 'MacBook Pro',
      'location': 'New York, USA',
      'lastActive': '2 hours ago',
      'icon': Icons.laptop
    },
    {
      'type': 'iPad Air',
      'location': 'Boston, USA',
      'lastActive': 'Yesterday, 8:45 PM',
      'icon': Icons.tablet
    },
  ];

  @override
  Widget build(BuildContext context) {
    final currentTime = TimeOfDay.now().format(context);
    return Scaffold(
      body: Column(
        children: [
          // Status Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(Icons.signal_cellular_4_bar, color: Colors.white),
                    SizedBox(width: 8),
                    Icon(Icons.wifi, color: Colors.white),
                  ],
                ),
                Text(currentTime, style: const TextStyle(color: Colors.white)),
                Row(
                  children: const [
                    Icon(Icons.battery_full, color: Colors.white),
                    SizedBox(width: 8),
                    Text('85%', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ],
            ),
          ),

          // App Header
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back),
                ),
                const Text('Privacy & Security',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(width: 24), // Spacer
              ],
            ),
          ),

          // Main Content
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildSection(
                  title: 'Account Security',
                  icon: Icons.shield,
                  children: [
                    _buildSettingTile(
                      icon: Icons.key,
                      title: 'Change Password',
                      subtitle: 'Last changed 45 days ago',
                    ),
                    _buildSwitchTile(
                      icon: Icons.lock,
                      title: 'Two-Factor Authentication',
                      subtitle: 'Additional security for your account',
                      value: twoFactorEnabled,
                      onChanged: (value) {
                        setState(() {
                          twoFactorEnabled = value;
                        });
                      },
                    ),
                  ],
                ),
                _buildSection(
                  title: 'Privacy Controls',
                  icon: Icons.visibility,
                  children: [
                    _buildSwitchTile(
                      icon: Icons.share,
                      title: 'Data Sharing Preferences',
                      subtitle: 'Control how your data is shared',
                      value: dataSharing,
                      onChanged: (value) {
                        setState(() {
                          dataSharing = value;
                        });
                      },
                    ),
                    _buildSwitchTile(
                      icon: Icons.visibility,
                      title: 'Profile Visibility',
                      subtitle: 'Control who can see your profile',
                      value: profileVisibility,
                      onChanged: (value) {
                        setState(() {
                          profileVisibility = value;
                        });
                      },
                    ),
                  ],
                ),
                _buildSection(
                  title: 'Device Management',
                  icon: Icons.devices,
                  children: devices.map((device) => _buildDeviceTile(device)).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blue.shade100,
                child: Icon(icon, color: Colors.blue),
              ),
              const SizedBox(width: 8),
              Text(title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 8),
          ...children,
        ],
      ),
    );
  }

  Widget _buildSettingTile({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {},
    );
  }

  Widget _buildSwitchTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
      ),
      onTap: () {},
    );
  }

  Widget _buildDeviceTile(Map<String, dynamic> device) {
    return ListTile(
      leading: Icon(device['icon']),
      title: Text(device['type']),
      subtitle:
          Text('${device['location']} • ${device['lastActive']}'),
      trailing: device['lastActive'] != 'Now (Current device)'
          ? IconButton(
              icon: const Icon(Icons.close, color: Colors.red),
              onPressed: () {},
            )
          : null,
    );
  }
}
