import 'package:nohunger/components/naira_svg_icon.dart';
import 'package:nohunger/utilities/constants.dart';
import 'package:flutter/material.dart';


class WalletBalanceCard extends StatelessWidget {
  const WalletBalanceCard({
    super.key,
    required this.balance,
    required this.onTabChargeBalance,
    required this.userName,
    required this.avatarUrl,
  });

  final double balance;
  final VoidCallback onTabChargeBalance;
  final String userName;
  final String avatarUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Blue background container
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(defaultPadding),
          decoration: const BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadious)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // First Row - User Info and Notification
              Row(
                children: [
                  // Avatar
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(avatarUrl),
                  ),
                  const SizedBox(width: defaultPadding),
                  // Welcome Text and Username
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Welcome Back,",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          userName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: defaultPadding),
              
              // Second Row - Balance Info
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Active Balance",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                        Row(
                          children: [
                            const NairaSvgIcon(color: Colors.white), // Use NairaSvgIcon here
                            const SizedBox(width: 4), // Add some space between the icon and the balance
                            Text(
                              balance.toStringAsFixed(2),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
              // Add extra padding at bottom to account for overlapping container
              const SizedBox(height: 60),
            ],
          ),
        ),
        
        // White container positioned to overlap
        Positioned(
          left: defaultPadding,
          right: defaultPadding,
          bottom: -50, // Negative value makes it overlap the blue container
          child: Container(
            padding: const EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(defaultBorderRadious),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 2),
                  blurRadius: 4,
                  color: Colors.black.withOpacity(0.1),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildActionButton(Icons.swap_horiz, "Transfer"),
                _buildActionButton(Icons.payment, "Payment"),
                _buildActionButton(Icons.shopping_cart, "Shop"),
                _buildActionButton(Icons.grid_view, "Other"),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: primaryColor),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}



// import 'package:client/utilities/constants.dart';
// import 'package:flutter/material.dart';

// class WalletBalanceCard extends StatelessWidget {
//   const WalletBalanceCard({
//     super.key,
//     required this.balance,
//     required this.onTabChargeBalance,
//     required this.userName,
//     required this.avatarUrl,
//   });

//   final double balance;
//   final VoidCallback onTabChargeBalance;
//   final String userName;
//   final String avatarUrl;

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       clipBehavior: Clip.none,
//       children: [
//         // Blue background container
//         Container(
//           width: double.infinity,
//           padding: const EdgeInsets.all(defaultPadding),
//           decoration: const BoxDecoration(
//             color: primaryColor,
//             borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadious)),
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               // First Row - User Info and Notification
//               Row(
//                 children: [
//                   // Avatar
//                   CircleAvatar(
//                     radius: 20,
//                     backgroundImage: NetworkImage(avatarUrl),
//                   ),
//                   const SizedBox(width: defaultPadding),
//                   // Welcome Text and Username
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           "Welcome Back,",
//                           style: TextStyle(
//                             color: Colors.white70,
//                             fontSize: 14,
//                           ),
//                         ),
//                         Text(
//                           userName,
//                           style: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   // Notification Icon
//                   IconButton(
//                     icon: const Icon(Icons.notifications_outlined, color: Colors.white),
//                     onPressed: () {},
//                   ),
//                 ],
//               ),
//               const SizedBox(height: defaultPadding),
              
//               // Second Row - Balance Info
//               Row(
//                 children: [
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           "Active Balance",
//                           style: TextStyle(
//                             color: Colors.white70,
//                             fontSize: 14,
//                           ),
//                         ),
//                         Text(
//                           "\$${balance.toStringAsFixed(2)}",
//                           style: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
//                     onPressed: () {},
//                   ),
//                 ],
//               ),
//               // Add extra padding at bottom to account for overlapping container
//               const SizedBox(height: 60),
//             ],
//           ),
//         ),
        
//         // White container positioned to overlap
//         Positioned(
//           left: defaultPadding,
//           right: defaultPadding,
//           bottom: -50, // Negative value makes it overlap the blue container
//           child: Container(
//             padding: const EdgeInsets.all(defaultPadding),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(defaultBorderRadious),
//               boxShadow: [
//                 BoxShadow(
//                   offset: const Offset(0, 2),
//                   blurRadius: 4,
//                   color: Colors.black.withOpacity(0.1),
//                 ),
//               ],
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 _buildActionButton(Icons.swap_horiz, "Transfer"),
//                 _buildActionButton(Icons.payment, "Payment"),
//                 _buildActionButton(Icons.shopping_cart, "Shop"),
//                 _buildActionButton(Icons.grid_view, "Other"),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildActionButton(IconData icon, String label) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Container(
//           padding: const EdgeInsets.all(12),
//           decoration: BoxDecoration(
//             color: Colors.blue.withOpacity(0.1),
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Icon(icon, color: primaryColor),
//         ),
//         const SizedBox(height: 8),
//         Text(
//           label,
//           style: const TextStyle(
//             fontSize: 12,
//             color: Colors.black87,
//           ),
//         ),
//       ],
//     );
//   }
// }