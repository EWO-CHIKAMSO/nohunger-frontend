import 'package:nohunger/screen/user/screens/checkout/components/cart_custom_button.dart';
import 'package:nohunger/screen/user/screens/checkout/components/order_item.dart';
import 'package:flutter/material.dart';

class TrackOrderScreen extends StatelessWidget {
  final String orderNumber;
  final String orderDate;
  final List<OrderItem> orderItems;

  const TrackOrderScreen({
    super.key,
    this.orderNumber = "#FDS639820",
    this.orderDate = "Jun 1, 2021",
    required this.orderItems,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Cancel order'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Order tracking container
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    // Order number and date
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Order $orderNumber',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Placed on $orderDate',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.chevron_right,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 1),

                    // Order status stepper
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 24.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildStepperItem('Ordered', true, true),
                          _buildStepperLine(true),
                          _buildStepperItem('Processing', true, true),
                          _buildStepperLine(false),
                          _buildStepperItem('Packed', false, false),
                          _buildStepperLine(false),
                          _buildStepperItem('Shipped', false, false),
                          _buildStepperLine(false),
                          _buildStepperItem('Delivered', false, false),
                        ],
                      ),
                    ),
                    const Divider(height: 1),

                    // Order items
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: orderItems,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Cancellation reason section
              const Text(
                'What is the biggest reason for your wish to cancel?',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 16),

              // Radio options
              _buildRadioOption("It's too costly."),
              _buildRadioOption(
                  "I found another product that fulfills my need."),
              _buildRadioOption("I don't use it enough."),
              _buildRadioOption("Other"),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CartCustomButton(
          onPressed: () {},
          buttonText: 'Cancel',
          backgroundColor:
              const Color(0xFFFF5C5C), // Red color for cancel button
        ),
      ),
    );
  }

  Widget _buildStepperItem(String label, bool isCompleted, bool isActive) {
    return Column(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isCompleted
                ? Colors.green
                : isActive
                    ? Colors.green.withOpacity(0.2)
                    : Colors.grey.withOpacity(0.2),
          ),
          child: isCompleted
              ? const Icon(Icons.check, color: Colors.white, size: 16)
              : null,
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isActive || isCompleted ? Colors.black : Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildStepperLine(bool isActive) {
    return Expanded(
      child: Container(
        height: 2,
        color: isActive ? Colors.green : Colors.grey.withOpacity(0.2),
        margin: const EdgeInsets.only(bottom: 32),
      ),
    );
  }

  Widget _buildRadioOption(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade300),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
