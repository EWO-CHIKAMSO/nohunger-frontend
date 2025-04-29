import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nohunger/screen/logistic/ui/change_password.dart';
import 'package:nohunger/screen/logistic/ui/privacy_policy.dart';
import 'package:nohunger/screen/logistic/ui/rider_support.dart';
import 'package:nohunger/screen/logistic/ui/term_and_conditions.dart';
import 'package:nohunger/screen/vendor/ui/order_history_screen.dart';
import 'package:nohunger/screen/vendor/widget/buttomnav.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback onGoBack;
  const HomeScreen({super.key, required this.onGoBack});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDarkMode = false;

  void _logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => BottomNav(onGoToSecondPage: widget.onGoBack),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(
        isDarkMode: isDarkMode,
        onThemeChanged: (value) {
          setState(() {
            isDarkMode = value;
          });
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 120,
        elevation: 8,
        title: Row(
          children: [
            Image.asset('assets/images/rider.PNG', height: 45, width: 45),
            SizedBox(width: 8),
            Text(
              "Rider",
              style: TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: Icon(Icons.exit_to_app, color: Colors.black, size: 30),
              ),
              SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Stack(
                  children: [
                    FaIcon(FontAwesomeIcons.bell),
                    Positioned(
                      bottom: 10,
                      left: 12,
                      child: Container(
                        height: 11,
                        width: 11,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 129, 6, 129),
                  Color.fromARGB(255, 231, 28, 28),
                ],
              ),
            ),
            padding: EdgeInsets.all(10),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Today's Orders",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.arrow_forward),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _orderCard("To Do", "0"),
                          _orderCard("Complete", "0"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text("No Orders Found"),
                SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
          print("Floating Action Button Pressed");
        },
        backgroundColor: Colors.pinkAccent,
        child: Icon(Icons.add,color: Colors.white,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _orderCard(String title, String count) {
    return Container(
      width: 160,
      height: 80,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 226, 225, 225),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  Text(
                    count,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.shopping_bag),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  const CustomDrawer({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.white),
            accountName: Text(
              "Demo Rider",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            accountEmail: Text("01700000000", style: TextStyle(color: Colors.grey)),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/avatar.png"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                _infoCard("Completed Job", "0", Icons.check_circle),
                SizedBox(width: 10),
                _infoCard("Cash Collected", "€0.00", Icons.attach_money),
              ],
            ),
          ),
          SizedBox(height: 20),
          _menuItem(context, Icons.history, "Order History", OrderHistoryScreen()),
          _menuItem(context, Icons.language, "Language", null, trailing: _languageWidget()),
          _menuItem(context, Icons.support_agent, "Rider Support", RiderSupportScreen()),
          _menuItem(context, Icons.policy, "Terms and Conditions", TermsandConditionsScreen()),
          _menuItem(context, Icons.lock, "Privacy Policy", PrivacyPolicyScreen()),
          _menuItem(context, Icons.password, "Change Password", ChangePasswordScreen()),
          _themeToggle(),
          _logoutButton(),
        ],
      ),
    );
  }

  Widget _infoCard(String title, String value, IconData icon) {
    return Expanded(
      child: Card(
        color: Colors.black87,
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              Text(title, style: TextStyle(color: Colors.white70, fontSize: 12)),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, color: Colors.green, size: 16),
                  SizedBox(width: 5),
                  Text(value, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _menuItem(BuildContext context, IconData icon, String title, Widget? screen,
      {Widget? trailing}) {
    return ListTile(
      leading: Icon(icon, color: Colors.pinkAccent),
      title: Text(title),
      trailing: trailing,
      onTap: screen != null
          ? () => Navigator.push(context, MaterialPageRoute(builder: (context) => screen))
          : null,
    );
  }

  Widget _languageWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.flag, color: Colors.red),
          SizedBox(width: 5),
          Text("ENG", style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _themeToggle() {
    return ListTile(
      leading: Icon(Icons.brightness_6, color: Colors.pinkAccent),
      title: Text("Theme"),
      trailing: Switch(value: isDarkMode, onChanged: onThemeChanged),
    );
  }

  Widget _logoutButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.redAccent,
          foregroundColor: Colors.white,
          minimumSize: Size(double.infinity, 40),
        ),
        onPressed: () {},
        icon: Icon(Icons.logout),
        label: Text("Logout"),
      ),
    );
  }
}
