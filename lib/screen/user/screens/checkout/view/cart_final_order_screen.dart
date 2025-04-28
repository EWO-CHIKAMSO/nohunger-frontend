import 'package:nohunger/route/route_constants.dart';
import 'package:nohunger/screen/user/screens/checkout/components/cart_custom_button.dart';
import 'package:nohunger/screen/user/screens/checkout/components/order_item.dart';
import 'package:flutter/material.dart';

class CartFinalOrderScreen extends StatelessWidget {
  final String orderNumber;
  final String email;
  final double amount;

  const CartFinalOrderScreen({
    super.key,
    this.orderNumber = "#FDS639820",
    this.email = "John.davids@gmail.com",
    this.amount = 400,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Order'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // First section - Illustration
              Image.asset(
                'assets/illustrations/Success_lightTheme.png',
                height: 200,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 24),

              // Second section - Thank you message
              const Text(
                'Thanks for your order',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                "You'll receive an email at\n$email once your order is confirmed.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),

              // Third section - Order details container
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Order detail',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildDetailRow(
                      'Order number',
                      orderNumber,
                      detailColor: Colors.black,
                    ),
                    const SizedBox(height: 12),
                    _buildDetailRow(
                      'Amount paid',
                      '\$$amount',
                      detailColor: Colors.green,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CartCustomButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              trackOrderRoute,
              arguments: {
                'orderItems': [
                  const OrderItem(
                    brand: 'WINTER HUDDI',
                    title: 'Butter...',
                    price: '299.43',
                    originalPrice: '534.33',
                    imageUrl: 'assets/images/user/stocks/other/butter.png',
                  ),
                  const OrderItem(
                    brand: 'WINTER HUDDI',
                    title: 'Butter...',
                    price: '299.43',
                    originalPrice: '534.33',
                    imageUrl: 'assets/images/user/stocks/other/butter.png',
                  ),
                ],
              },
            );
          },
          buttonText: 'Track order',
          backgroundColor: const Color(0xFF6C5CE7),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String detail, {Color? detailColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
          ),
        ),
        Text(
          detail,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: detailColor,
          ),
        ),
      ],
    );
  }
}
