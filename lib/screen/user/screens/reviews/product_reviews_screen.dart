import 'package:nohunger/route/route_constants.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Reviews'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          // First section - Rating Overview
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Left side - Overall rating
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                '4.6',
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                              Text(
                                '/5',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                          const Text('Based on 120 Reviews'),
                          const SizedBox(height: 8),
                          Row(
                            children: List.generate(
                              5,
                              (index) => Icon(
                                Icons.star,
                                color: index < 4 ? Colors.amber : Colors.grey.shade300,
                                size: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Right side - Star breakdown
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          _buildRatingBar('5 Star', 0.8),
                          _buildRatingBar('4 Star', 0.6),
                          _buildRatingBar('3 Star', 0.3),
                          _buildRatingBar('2 Star', 0.2),
                          _buildRatingBar('1 Star', 0.1),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Second section - Add Review Button
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey.shade200),
                bottom: BorderSide(color: Colors.grey.shade200),
              ),
            ),
            child: ListTile(
              leading: const Icon(Icons.add_circle_outline),
              title: const Text('Add Review'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.pushNamed(
  context, 
  addReviewsScreenRoute,
  arguments: {
    'productImage': 'assets/images/product.jpg',
    'brandName': 'LIPSY LONDON',
    'productName': 'Sleeveless Ruffle',
  },
),
            ),
          ),

          // Third section - User Reviews
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'User reviews',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Text('Most useful'),
                        Icon(Icons.keyboard_arrow_down),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Review items
                _buildReviewItem(
                  'Arman Rokni',
                  '36s ago',
                  4,
                  "A cool gray cap in soft cssordurory. Watch me.' By bussying cottoaaan products from Lindex, you're more responsibly.",
                ),
                const SizedBox(height: 16),
                _buildReviewItem(
                  'Sepide Mo...',
                  '2h ago',
                  4,
                  "A cool gray cap in soft cssordurory. Watch me.' By bussying cottoaaan products from Lindex, you're more responsibly.",
                ),
                const SizedBox(height: 16),
                _buildReviewItem(
                  'Afshin Moh...',
                  '24h ago',
                  4,
                  "A cool gray cap in soft cssordurory. Watch me.' By bussying cottoaaan products from Lindex, you're more responsibly.",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingBar(String label, double value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          SizedBox(
            width: 50,
            child: Text(
              label,
              style: const TextStyle(fontSize: 12),
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(2),
              child: LinearProgressIndicator(
                value: value,
                backgroundColor: Colors.grey.shade200,
                color: Colors.amber,
                minHeight: 8,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewItem(String name, String time, int rating, String comment) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.shade300,
                radius: 20,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          time,
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: List.generate(
                        5,
                        (index) => Icon(
                          Icons.star,
                          size: 16,
                          color: index < rating ? Colors.amber : Colors.grey.shade300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            comment,
            style: TextStyle(
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}


// import 'package:client/screen/user/components/buy_full_ui_kit.dart';
// import 'package:flutter/material.dart';

// class ProductReviewsScreen extends StatelessWidget {
//   const ProductReviewsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const BuyFullKit(images: [
//       "assets/screenshots/reviews.png",
//       "assets/screenshots/Add review rate.png"
//     ]);
//   }
// }
