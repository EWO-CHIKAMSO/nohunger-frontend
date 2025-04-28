import 'package:nohunger/route/route_constants.dart';
import 'package:nohunger/screen/user/components/dashed_divider.dart';
import 'package:nohunger/screen/user/screens/checkout/components/cart_custom_button.dart';
import 'package:nohunger/screen/user/screens/home/components/section_header.dart';
import 'package:flutter/material.dart';

import '../components/build_summary_row.dart';
import '../components/order_item.dart';

class CartReviewScreen extends StatelessWidget {
  const CartReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Review'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Office Location Section
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[200]!),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.grey[100],
                                    child: const Icon(
                                      Icons.home_work_outlined,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  SectionHeader(
                                    title: 'Office',
                                    onViewMore: () {},
                                    showViewMore: false,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Rio Nowakowska, Zabiniec 12/222,\n31-215 Cracow, Poland',
                                style: TextStyle(
                                  color: Colors.grey,
                                  height: 1.5,
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                '+79 123 456 789',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                              child: Icon(Icons.location_on, color: Colors.red),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Payment Method Section
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[200]!),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      title: const Text(
                        'Payment method',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Make it a Gift Section
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[200]!),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color(0xFF6C5CE7),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.card_giftcard,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 16),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Make it a Gift',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                'Wrap it in a gift for \$20',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Switch(
                          value: false,
                          onChanged: (value) {},
                          activeColor: const Color(0xFF6C5CE7),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Order Summary Section
                  SectionHeader(
                    title: 'Order Summary',
                    onViewMore: () {},
                    showViewMore: false,
                  ),
                  const SizedBox(height: 16),

                  // Using SummaryRow component
                  const SummaryRow(
                    label: 'Subtotal',
                    value: '24',
                  ),
                  const SummaryRow(
                    label: 'Shipping Fee',
                    value: 'Free',
                    isGreen: true,
                  ),
                  const DashedDivider(),
                  const SummaryRow(
                    label: 'Total (Include of VAT)',
                    value: '25',
                  ),
                  const SummaryRow(
                    label: 'Estimated VAT',
                    value: '1',
                  ),
                  const SizedBox(height: 24),

                  // Review your order Section
                  SectionHeader(
                    title: 'Review your order',
                    onViewMore: () {},
                    showViewMore: false,
                  ),
                  const SizedBox(height: 16),

                  // Using OrderItem component
                  const OrderItem(
                    brand: 'WINTER HUDDI',
                    title: 'Sleeveless Tiered Dobby...',
                    price: '299.43',
                    originalPrice: '534.33',
                    imageUrl: 'assets/images/user/stocks/other/butter.png',
                  ),
                  const OrderItem(
                    brand: 'WINTER HUDDI',
                    title: 'Sleeveless Tiered Dobby...',
                    price: '299.43',
                    originalPrice: '534.33',
                    imageUrl: 'assets/images/user/stocks/other/butter.png',
                  ),
                  const OrderItem(
                    brand: 'WINTER HUDDI',
                    title: 'Sleeveless Tiered Dobby...',
                    price: '299.43',
                    originalPrice: '534.33',
                    imageUrl: 'assets/images/user/stocks/other/butter.png',
                  ),
                  // Add bottom padding to account for the fixed button
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
          // Using CartCustomButton component
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: CartCustomButton(
              buttonText: 'Continue',
              onPressed: () {
                Navigator.pushNamed(context, cartPaymentMethodScreenRoute);
              },
            ),
          ),
        ],
      ),
    );
  }
}
