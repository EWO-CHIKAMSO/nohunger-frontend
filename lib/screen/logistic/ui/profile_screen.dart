import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool darkMode = false;


  @override
  Widget build(BuildContext context) {
    final currentTime = DateFormat.Hm().format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      
        actions: [Padding(
          padding: const EdgeInsets.all(16.0),
          child: Icon(Icons.edit),
        )],
      ),
      // backgroundColor: Colors.grey[100],
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: 3,
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //     BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'Orders'),
      //     BottomNavigationBarItem(icon: Icon(Icons.headset), label: 'Support'),
      //     BottomNavigationBarItem(icon: Icon(Icons.person, color: Colors.blue), label: 'Profile'),
      //   ],
      // ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 120, bottom: 80),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  _buildProfileOverview(),
                  _buildQuickActions(),
                  _buildAccountInformation(),
                  _buildPerformanceStats(),
                  _buildSettings(null),
                  _buildAccountActions(),
                ],
              ),
            ),
          ),
          // _buildStatusBar(currentTime),
          // _buildHeader(),
        ],
      ),
    );
  }

  Widget _buildStatusBar(String time) {
    return Container(
      color: Colors.black,
      height: 28,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              Icon(Icons.signal_cellular_alt, color: Colors.white, size: 14),
              SizedBox(width: 4),
              Icon(Icons.wifi, color: Colors.white, size: 14),
            ],
          ),
          Text(time, style: const TextStyle(color: Colors.white, fontSize: 12)),
          const Row(
            children: [
              Icon(Icons.battery_3_bar, color: Colors.white, size: 14),
              SizedBox(width: 4),
              Text("85%", style: TextStyle(color: Colors.white, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }

  // Widget _buildHeader() {
  //   return Positioned(
  //     top: 28,
  //     left: 0,
  //     right: 0,
  //     child: AppBar(
  //       backgroundColor: Colors.white,
  //       elevation: 4,
  //       title: const Text("Profile", style: TextStyle(color: Colors.black)),
  //       centerTitle: true,
  //       leading: IconButton(
  //         icon: const Icon(Icons.arrow_back, color: Colors.grey),
  //         onPressed: () {},
  //       ),
  //       actions: [
  //         IconButton(
  //           icon: const Icon(Icons.edit, color: Colors.blue),
  //           onPressed: () {},
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildProfileOverview() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 48,
                  backgroundImage: NetworkImage(
                      'https://readdy.ai/api/search-image?query=Professional%20portrait%20photo%20of%20a%20young%20male%20delivery%20driver...'),
                ),
                Positioned(
                  bottom: 4,
                  right: 4,
                  child: CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 12,
                    child: const Icon(Icons.check, size: 14, color: Colors.white),
                  ),
                )
              ],
            ),
            const SizedBox(height: 12),
            const Text("Michael Anderson", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const Text("Active Rider", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.star, color: Colors.amber, size: 18),
                Icon(Icons.star, color: Colors.amber, size: 18),
                Icon(Icons.star, color: Colors.amber, size: 18),
                Icon(Icons.star, color: Colors.amber, size: 18),
                Icon(Icons.star_half, color: Colors.amber, size: 18),
                SizedBox(width: 6),
                Text("4.8/5.0"),
              ],
            ),
            const SizedBox(height: 4),
            const Text("1,248 Deliveries Completed", style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions() {
    final items = [
      {'icon': Icons.edit, 'label': "Edit Profile", 'color': Colors.blue},
      {'icon': Icons.credit_card, 'label': "Payment", 'color': Colors.green},
      {'icon': Icons.emoji_events, 'label': "Achievements", 'color': Colors.yellow[700]},
      {'icon': Icons.settings, 'label': "Settings", 'color': Colors.purple},
    ];

    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (_, index) {
          final item = items[index];
          return Container(
            width: 90,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
            ),
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: (item['color'] as Color).withOpacity(0.2),
                  child: Icon(item['icon'] as IconData, color: item['color'] as Color),
                ),
                const SizedBox(height: 8),
                Text(item['label'] as String, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildAccountInformation() {
    return _buildInfoSection(
      title: "Account Information",
      items: [
        _infoTile(Icons.phone, "Phone Number", "+1 (555) 123-4567", Colors.blue),
        _infoTile(Icons.email, "Email Address", "michael.anderson@example.com", Colors.green),
        _infoTile(Icons.calendar_today, "Joined Date", "March 15, 2023", Colors.orange),
        _infoTile(Icons.motorcycle, "Vehicle Information", "Honda CB125F (2022) - Blue", Colors.red),
      ],
    );
  }

  Widget _buildPerformanceStats() {
    final stats = [
      {'icon': Icons.attach_money, 'label': "Total Earnings", 'value': "\$8,742.50", 'color': Colors.green},
      {'icon': Icons.check_circle, 'label': "Completion Rate", 'value': "98.7%", 'color': Colors.blue},
      {'icon': Icons.access_time, 'label': "On-time Rate", 'value': "95.2%", 'color': Colors.purple},
      {'icon': Icons.star, 'label': "Customer Rating", 'value': "4.8/5.0", 'color': Colors.yellow[800]},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Performance Stats", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
        const SizedBox(height: 8),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: stats.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2.2),
          itemBuilder: (_, index) {
            final stat = stats[index];
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: (stat['color'] as Color).withOpacity(0.2),
                          child: Icon(stat['icon'] as IconData, color: stat['color'] as Color),
                        ),
                        const SizedBox(width: 8),
                        Text(stat['label'] as String, style: const TextStyle(fontSize: 12)),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(stat['value'] as String, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildSettings(dynamic ontap) {
    return _buildInfoSection(
      items: [
        _settingTile(Icons.notifications, "Notification Preferences", Colors.blue),
        // _settingTile(Icons.language, "Language Settings", Colors.green),
        // _settingTile(Icons.security, "Privacy & Security", Colors.red),
        // _settingTile(Icons.headset_mic, "Help & Support", Colors.purple),
      ],
    );
  }

  Widget _buildAccountActions() {
    return _buildInfoSection(
      items: [
        _settingTileWithSwitch(Icons.dark_mode, "Dark Mode", darkMode, (val) {
          setState(() {
            darkMode = val;
          });
        }),
        _settingTile(Icons.description, "Terms & Conditions", Colors.blue),
        _settingTile(Icons.verified_user, "Privacy Policy", Colors.green),
        Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
            icon: const Icon(Icons.logout),
            label: const Text("Logout"),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildInfoSection({String? title, required List<Widget> items}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          if (title != null)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
            ),
          ...items,
        ],
      ),
    );
  }

  Widget _infoTile(IconData icon, String label, String value, Color color) {
    return ListTile(
      leading: CircleAvatar(backgroundColor: color.withOpacity(0.2), child: Icon(icon, color: color)),
      title: Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      subtitle: Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
    );
  }

  Widget _settingTile(IconData icon, String label, Color color) {
    return ListTile(
      leading: CircleAvatar(backgroundColor: color.withOpacity(0.2), child: Icon(icon, color: color)),
      title: Text(label),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {},
    );
  }

  Widget _settingTileWithSwitch(IconData icon, String label, bool value, Function(bool) onChanged) {
    return ListTile(
      leading: CircleAvatar(backgroundColor: Colors.grey[300], child: Icon(icon, color: value ? Colors.blue : Colors.grey)),
      title: Text(label),
      trailing: Switch(value: value, onChanged: onChanged),
    );
  }
}
