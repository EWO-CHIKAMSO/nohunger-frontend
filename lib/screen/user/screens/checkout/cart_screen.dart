import 'package:nohunger/route/route_constants.dart';
import 'package:nohunger/screen/user/components/dashed_divider.dart';
import 'package:nohunger/screen/user/screens/home/components/section_header.dart';
import 'package:flutter/material.dart';

import 'components/build_summary_row.dart';
import 'components/cart_custom_button.dart';
import 'components/order_item.dart';
// import 'package:flutter_svg/svg.dart';



class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionHeader(
                title: 'Review your order',
                showViewMore: false,
                onViewMore: () {
                  // Handle view more action
                },
              ),
              const SizedBox(height: 16),
              const OrderItem(
                brand: 'WINTER HUDDI',
                title: 'Sleeveless Tiered Dobby...',
                price: '299.43',
                originalPrice: '534.33',
                imageUrl: 'assets/images/user/stocks/other/butter.png',
              ),
              const SizedBox(height: 16),
              const OrderItem(
                brand: 'WINTER HUDDI',
                title: 'Printed Sleeveless Tiered...',
                price: '299.43',
                originalPrice: '534.33',
                imageUrl: 'assets/images/user/stocks/other/butter.png',
              ),
              const SizedBox(height: 24),
              SectionHeader(
                title: 'Your Coupon code',
                showViewMore: false,
                onViewMore: () {
                  // Handle view more action
                },
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Type coupon code',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  prefixIcon: Icon(Icons.confirmation_number_outlined,
                      color: Colors.grey[400]),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey[200]!),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey[200]!),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionHeader(
                        title: 'Order Summary',
                        showViewMore: false,
                        onViewMore: () {
                          // Handle view more action
                        },
                      ),
                      const SizedBox(height: 16),
                      const SummaryRow(label: 'Subtotal', value: '24'),
                      const SummaryRow(label: 'Shipping Fee', value: 'Free', isGreen: true),
                      const DashedDivider(),
                      const SummaryRow(label: 'Total (Include of VAT)', value: '25'),
                      const SummaryRow(label: 'Estimated VAT', value: '1'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              CartCustomButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    cartReviewScreenRoute,
                  );
                },
                buttonText: 'Checkout',
              ),
            ],
          ),
        ),
      ),
    );
  }
}