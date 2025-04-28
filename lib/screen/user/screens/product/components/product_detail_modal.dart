import 'package:flutter/material.dart';

class ProductDetailsModal extends StatelessWidget {
  const ProductDetailsModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header section with back button and title
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back),
              ),
              const Expanded(
                child: Text(
                  'Stocks Details',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              // Empty SizedBox to balance the back button
              const SizedBox(width: 24),
            ],
          ),
        ),

        // Description section
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Description',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "A delicious traditional Nigerian jollof rice made with the finest long-grain rice, fresh tomatoes, and a blend of aromatic spices. Served with perfectly grilled chicken...",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),

        // Ingredients section
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Ingredients',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 12),
              _buildIngredientsList(),
            ],
          ),
        ),

        // Food Information section
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'stock Information',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  SizedBox(
                    width: 120,
                    child: Text(
                      'Cuisine:',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Text('Nigerian'),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  SizedBox(
                    width: 120,
                    child: Text(
                      'Preparation Time:',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Text('25-30 minutes'),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  SizedBox(
                    width: 120,
                    child: Text(
                      'Spice Level:',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Text('Medium'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildIngredientsList() {
    final ingredients = [
      'Long-grain rice (locally sourced)',
      'Fresh tomatoes and bell peppers',
      'Onions and garlic',
      'Traditional Nigerian spices',
      'Grilled chicken (antibiotic-free)',
      'Vegetable oil',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: ingredients.map((ingredient) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('• ', style: TextStyle(color: Colors.grey)),
              Expanded(
                child: Text(
                  ingredient,
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}


// import 'package:flutter/material.dart';

// class ProductDetailsModal extends StatelessWidget {
//   const ProductDetailsModal({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Header section with back button and title
//         Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Row(
//             children: [
//               GestureDetector(
//                 onTap: () => Navigator.pop(context),
//                 child: const Icon(Icons.arrow_back),
//               ),
//               const Expanded(
//                 child: Text(
//                   'Stock details',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//               // Empty SizedBox to balance the back button
//               const SizedBox(width: 24),
//             ],
//           ),
//         ),

//         // Story section
//         const Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Story',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               SizedBox(height: 8),
//               Text(
//                 "A cool gray cap in soft corduroy. Watch me.' By buying cotton products from Lindex, you're supporting more responsibly...",
//                 style: TextStyle(
//                   color: Colors.grey,
//                   fontSize: 16,
//                 ),
//               ),
//             ],
//           ),
//         ),

//         // Details section
//         Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'Details',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               const SizedBox(height: 12),
//               _buildDetailsList(),
//             ],
//           ),
//         ),

//         // Style Notes section
//         const Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Style Notes',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               SizedBox(height: 12),
//               Row(
//                 children: [
//                   SizedBox(
//                     width: 100,
//                     child: Text(
//                       'Style:',
//                       style: TextStyle(color: Colors.grey),
//                     ),
//                   ),
//                   Text('Summer Hat'),
//                 ],
//               ),
//               SizedBox(height: 8),
//               Row(
//                 children: [
//                   SizedBox(
//                     width: 100,
//                     child: Text(
//                       'Design:',
//                       style: TextStyle(color: Colors.grey),
//                     ),
//                   ),
//                   Text('Plain'),
//                 ],
//               ),
//               SizedBox(height: 8),
//               Row(
//                 children: [
//                   SizedBox(
//                     width: 100,
//                     child: Text(
//                       'Fabric:',
//                       style: TextStyle(color: Colors.grey),
//                     ),
//                   ),
//                   Text('Jersey'),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildDetailsList() {
//     final details = [
//       'Materials: 100% cotton, and lining Structured',
//       'Adjustable cotton strap closure',
//       'High quality embroidery stitching',
//       'Head circumference: 21" - 24" / 54-62 cm',
//       'Embroidery stitching',
//       'One size fits most',
//     ];

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: details.map((detail) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(vertical: 4.0),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text('• ', style: TextStyle(color: Colors.grey)),
//               Expanded(
//                 child: Text(
//                   detail,
//                   style: const TextStyle(color: Colors.grey),
//                 ),
//               ),
//             ],
//           ),
//         );
//       }).toList(),
//     );
//   }
// }