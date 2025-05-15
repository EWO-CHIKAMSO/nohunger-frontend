import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile header
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blue,
                    child: Text(
                      'SJ',
                      style: TextStyle(fontSize: 36, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Sarah Johnson',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Administrator',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'sarah.johnson@foodmart.com',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Edit Profile'),
                      ),
                      const SizedBox(width: 16),
                      OutlinedButton(
                        onPressed: () {},
                        child: const Text('Change Password'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            
            // Account settings
            const Text(
              'Account Settings',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildSettingsItem(
              icon: Icons.notifications_outlined,
              title: 'Notifications',
              subtitle: 'Configure notification preferences',
              onTap: () {},
            ),
            _buildSettingsItem(
              icon: Icons.language_outlined,
              title: 'Language',
              subtitle: 'English (US)',
              onTap: () {},
            ),
            _buildSettingsItem(
              icon: Icons.dark_mode_outlined,
              title: 'Theme',
              subtitle: 'Light mode',
              onTap: () {},
            ),
            
            const SizedBox(height: 32),
            
            // System settings
            const Text(
              'System Settings',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildSettingsItem(
              icon: Icons.people_outline,
              title: 'User Management',
              subtitle: 'Manage system users and permissions',
              onTap: () {},
            ),
            _buildSettingsItem(
              icon: Icons.settings_outlined,
              title: 'System Configuration',
              subtitle: 'Configure system-wide settings',
              onTap: () {},
            ),
            _buildSettingsItem(
              icon: Icons.backup_outlined,
              title: 'Backup & Restore',
              subtitle: 'Manage system backups',
              onTap: () {},
            ),
            
            const SizedBox(height: 32),
            
            // Support
            const Text(
              'Support',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildSettingsItem(
              icon: Icons.help_outline,
              title: 'Help Center',
              subtitle: 'Get help with using the system',
              onTap: () {},
            ),
            _buildSettingsItem(
              icon: Icons.contact_support_outlined,
              title: 'Contact Support',
              subtitle: 'Reach out to our support team',
              onTap: () {},
            ),
            _buildSettingsItem(
              icon: Icons.info_outline,
              title: 'About',
              subtitle: 'Version 1.0.0',
              onTap: () {},
            ),
            
            const SizedBox(height: 24),
            
            // Logout button
            Center(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.logout, color: Colors.white),
                label: const Text('Logout'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(200, 48),
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}