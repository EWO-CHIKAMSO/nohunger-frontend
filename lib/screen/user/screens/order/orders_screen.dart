import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Orders',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Find an order...',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
                  suffixIcon: Icon(Icons.tune, color: Colors.grey[800]),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
            child: Text(
              'Orders history',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          _buildOrderItem(
            icon: Icons.payment,
            title: 'Awaiting Payment',
            count: 0,
            color: Colors.amber,
          ),
          _buildOrderItem(
            icon: Icons.inventory_2,
            title: 'Processing',
            count: 1,
            color: Colors.blue,
          ),
          _buildOrderItem(
            icon: Icons.local_shipping,
            title: 'Delivered',
            count: 5,
            color: Colors.blue,
          ),
          _buildOrderItem(
            icon: Icons.shopping_cart,
            title: 'returned',
            count: 3,
            color: Colors.blue,
          ),
          _buildOrderItem(
            icon: Icons.cancel,
            title: 'Canceled',
            count: 2,
            color: Colors.red,
          ),
        ],
      ),
    );
  }

  Widget _buildOrderItem({
    required IconData icon,
    required String title,
    required int count,
    required Color color,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey[200]!),
        ),
      ),
      child: ListTile(
        leading: Icon(icon, size: 24),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                count.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}




// import 'package:client/screen/user/components/buy_full_ui_kit.dart';
// import 'package:flutter/material.dart';


// class OrdersScreen extends StatelessWidget {
//   const OrdersScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const BuyFullKit(images: [
//       "assets/screenshots/Orders.png",
//       "assets/screenshots/Cancel order - Select a reason.png"
//     ]);
//   }
// }