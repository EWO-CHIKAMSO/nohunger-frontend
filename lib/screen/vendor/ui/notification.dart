import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  String activeTab = 'All';
  final List<String> tabs = ['All', 'Orders', 'Messages', 'System'];

  List<Map<String, dynamic>> notifications = [
    {
      'id': 1,
      'type': 'Orders',
      'priority': 'high',
      'title': 'New Order #12458',
      'description': 'Customer John D. placed a new order for \$32.50',
      'time': '10 min ago',
      'read': false
    },
    {
      'id': 2,
      'type': 'Orders',
      'priority': 'medium',
      'title': 'Order #12445 Ready for Pickup',
      'description': 'Delivery partner is waiting at your location',
      'time': '25 min ago',
      'read': false
    },
    {
      'id': 3,
      'type': 'Messages',
      'priority': 'normal',
      'title': 'Message from Customer',
      'description': 'Emily H.: Do you have gluten-free options available?',
      'time': '1 hour ago',
      'read': true
    },
    {
      'id': 4,
      'type': 'System',
      'priority': 'low',
      'title': 'Weekly Performance Report',
      'description': 'Your store performance improved by 12% this week',
      'time': '3 hours ago',
      'read': true
    },
    {
      'id': 5,
      'type': 'Orders',
      'priority': 'medium',
      'title': 'Order #12441 Completed',
      'description': 'Customer rated your service 5 stars!',
      'time': '5 hours ago',
      'read': true
    },
    {
      'id': 6,
      'type': 'System',
      'priority': 'low',
      'title': 'Platform Maintenance',
      'description': 'Scheduled maintenance on May 3rd, 2:00 AM - 4:00 AM',
      'time': 'Yesterday',
      'read': true
    },
    {
      'id': 7,
      'type': 'Messages',
      'priority': 'normal',
      'title': 'Message from Support',
      'description': 'Your inquiry about payment processing has been answered',
      'time': 'Yesterday',
      'read': true
    },
    {
      'id': 8,
      'type': 'Orders',
      'priority': 'high',
      'title': 'New Order #12438',
      'description': 'Customer Michael T. placed a new order for \$45.75',
      'time': 'Yesterday',
      'read': true
    },
    {
      'id': 9,
      'type': 'System',
      'priority': 'low',
      'title': 'New Feature Available',
      'description': 'You can now schedule promotions in advance',
      'time': 'Earlier this week',
      'read': true
    },
    {
      'id': 10,
      'type': 'Messages',
      'priority': 'normal',
      'title': 'Message from Delivery Partner',
      'description': 'Alex: I\'m having trouble finding your location',
      'time': 'Earlier this week',
      'read': true
    },
  ];

  Color getPriorityColor(String priority) {
    switch (priority) {
      case 'high':
        return Colors.red;
      case 'medium':
        return Colors.orange;
      case 'normal':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  IconData getIconData(String type) {
    switch (type) {
      case 'Orders':
        return Icons.shopping_bag;
      case 'Messages':
        return Icons.message;
      default:
        return Icons.notifications;
    }
  }

  void markAsRead(int id) {
    setState(() {
      for (var n in notifications) {
        if (n['id'] == id) {
          n['read'] = true;
          break;
        }
      }
    });
  }

  Map<String, List<Map<String, dynamic>>> groupNotifications(List<Map<String, dynamic>> list) {
    final Map<String, List<Map<String, dynamic>>> grouped = {};
    for (var n in list) {
      String group;
      final time = n['time'];
      if (time.contains('min') || time.contains('hour')) {
        group = 'Today';
      } else if (time == 'Yesterday') {
        group = 'Yesterday';
      } else {
        group = 'Earlier';
      }
      grouped.putIfAbsent(group, () => []).add(n);
    }
    return grouped;
  }

  @override
  Widget build(BuildContext context) {
    final filtered = activeTab == 'All'
        ? notifications
        : notifications.where((n) => n['type'] == activeTab).toList();
    final grouped = groupNotifications(filtered);

    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list, color: Colors.grey[700]),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Tabs
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: tabs.map((tab) {
                final selected = activeTab == tab;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ChoiceChip(
                    label: Text(tab),
                    selected: selected,
                    onSelected: (_) => setState(() => activeTab = tab),
                    selectedColor: Colors.blue,
                    labelStyle: TextStyle(color: selected ? Colors.white : Colors.black),
                  ),
                );
              }).toList(),
            ),
          ),
          // Notification List
          Expanded(
            child: filtered.isEmpty
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.notifications_off, size: 60, color: Colors.grey),
                        Text('No notifications yet', style: TextStyle(fontSize: 18)),
                        SizedBox(height: 8),
                        Text('When you receive notifications, they will appear here', textAlign: TextAlign.center),
                      ],
                    ),
                  )
                : ListView(
                    padding: EdgeInsets.only(top: 16),
                    children: grouped.entries.map((entry) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                            child: Text(entry.key, style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey)),
                          ),
                          ...entry.value.map((n) => ListTile(
                                onTap: () => markAsRead(n['id']),
                                tileColor: n['read'] ? Colors.white : Colors.blue[50],
                                leading: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    Icon(getIconData(n['type']), size: 30, color: Colors.grey),
                                    Positioned(
                                      left: -6,
                                      child: Container(
                                        width: 8,
                                        height: 8,
                                        decoration: BoxDecoration(
                                          color: getPriorityColor(n['priority']),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                title: Text(n['title'],
                                    style: TextStyle(
                                        fontWeight: n['read'] ? FontWeight.w400 : FontWeight.w600)),
                                subtitle: Text(n['description']),
                                trailing: Text(n['time'], style: TextStyle(fontSize: 12, color: Colors.grey)),
                              )),
                        ],
                      );
                    }).toList(),
                  ),
          ),
        ],
      ),
     
    );
  }
}
