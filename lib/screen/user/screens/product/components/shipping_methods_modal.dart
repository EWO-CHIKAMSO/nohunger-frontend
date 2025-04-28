import 'package:nohunger/components/naira_svg_icon.dart';
import 'package:nohunger/utilities/constants.dart';
import 'package:flutter/material.dart';

class ShippingMethodsModal extends StatelessWidget {
  const ShippingMethodsModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Header section
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
              const Text(
                'Shipping methods',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.info_outline),
                onPressed: () {},
              ),
            ],
          ),
        ),
        
        // Shipping methods list
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Standard shipping
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.check_circle_outline),
                              SizedBox(width: 8),
                              Text(
                                'Standard',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Arrives in 5-8 business days',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Order up to '),
                              Row(
                                children: [
                                  NairaSvgIcon(color: blackColor60),
                                  Text('49.99:'),
                                ],
                              ),
                              Row(
                                children: [
                                  NairaSvgIcon(color: blackColor60),
                                  Text('4.95'),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text('Orders '),
                                  NairaSvgIcon(color: blackColor60),
                                  Text('50 and over:'),
                                ],
                              ),
                              Text('Free'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.shade100,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Free with noHungerApp Premier',
                          style: TextStyle(color: Colors.deepPurple),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 12),
              
              // Express shipping
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.diamond_outlined),
                                  SizedBox(width: 8),
                                  Text(
                                    'Express',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  NairaSvgIcon(color: blackColor60),
                                  Text('14.95'),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Arrives in 2-3 business days',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Free with noHungerApp Premier',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 12),
              
              // Rush shipping
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rush',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Arrives in 1-2 business days',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        NairaSvgIcon(color: blackColor60),
                        Text('21.95'),
                      ],
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 12),
              
              // Truck shipping
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Truck',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Arrives in 2-4 weeks once shipped',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        NairaSvgIcon(color: blackColor60),
                        Text('102.50'),
                      ],
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Footer text
              Text(
                'Rush shipping may not be available for all orders depending on fulfillment location.',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 8),
              // Modified footer text section to handle overflow
              Wrap(
                children: [
                  Text(
                    'Shipping outside of Nigeria? See our ',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle international shipping link tap
                    },
                    child: const Text(
                      'International shipping',
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Text(
                    ' rates.',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'This item is available for delivery to one of our convenient Collection Points.',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


// import 'package:flutter/material.dart';

// class ShippingMethodsModal extends StatelessWidget {
//   const ShippingMethodsModal({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         // Header section
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               IconButton(
//                 icon: const Icon(Icons.arrow_back),
//                 onPressed: () => Navigator.pop(context),
//               ),
//               const Text(
//                 'Shipping methods',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               IconButton(
//                 icon: const Icon(Icons.info_outline),
//                 onPressed: () {},
//               ),
//             ],
//           ),
//         ),
        
//         // Shipping methods list
//         Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             children: [
//               // Standard shipping
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                   border: Border.all(color: Colors.grey.shade200),
//                 ),
//                 child: Column(
//                   children: [
//                     const Padding(
//                       padding: const EdgeInsets.all(16),
//                       child: const Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Row(
//                             children: [
//                               const Icon(Icons.check_circle_outline),
//                               const SizedBox(width: 8),
//                               const Text(
//                                 'Standard',
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 4),
//                           const Text(
//                             'Arrives in 5-8 business days',
//                             style: TextStyle(
//                               color: Colors.grey,
//                               fontSize: 14,
//                             ),
//                           ),
//                           const SizedBox(height: 8),
//                           const Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               const Text('Order up to \$49.99:'),
//                               const Text('\$4.95'),
//                             ],
//                           ),
//                           const Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               const Text('Orders \$50 and over:'),
//                               const Text('Free'),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       width: double.infinity,
//                       padding: const EdgeInsets.symmetric(vertical: 12),
//                       decoration: BoxDecoration(
//                         color: Colors.deepPurple.shade100,
//                         borderRadius: const BorderRadius.only(
//                           bottomLeft: Radius.circular(12),
//                           bottomRight: Radius.circular(12),
//                         ),
//                       ),
//                       child: const Center(
//                         child: Text(
//                           'Free with noHungerApp Premier',
//                           style: TextStyle(color: Colors.deepPurple),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
              
//               const SizedBox(height: 12),
              
//               // Express shipping
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                   border: Border.all(color: Colors.grey.shade200),
//                 ),
//                 child: Column(
//                   children: [
//                     const Padding(
//                       padding: const EdgeInsets.all(16),
//                       child: const Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               const Row(
//                                 children: [
//                                   const Icon(Icons.diamond_outlined),
//                                   const SizedBox(width: 8),
//                                   const Text(
//                                     'Express',
//                                     style: TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const Text('\$14.95'),
//                             ],
//                           ),
//                           const SizedBox(height: 4),
//                           const Text(
//                             'Arrives in 2-3 business days',
//                             style: TextStyle(
//                               color: Colors.grey,
//                               fontSize: 14,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       width: double.infinity,
//                       padding: const EdgeInsets.symmetric(vertical: 12),
//                       decoration: BoxDecoration(
//                         color: Colors.blue.shade50,
//                         borderRadius: const BorderRadius.only(
//                           bottomLeft: Radius.circular(12),
//                           bottomRight: Radius.circular(12),
//                         ),
//                       ),
//                       child: const Center(
//                         child: Text(
//                           'Free with noHungerApp Premier',
//                           style: TextStyle(color: Colors.blue),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
              
//               const SizedBox(height: 12),
              
//               // Rush shipping
//               Container(
//                 padding: const EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                   border: Border.all(color: Colors.grey.shade200),
//                 ),
//                 child: const Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           'Rush',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         const SizedBox(height: 4),
//                         const Text(
//                           'Arrives in 1-2 business days',
//                           style: TextStyle(
//                             color: Colors.grey,
//                             fontSize: 14,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const Text('\$21.95'),
//                   ],
//                 ),
//               ),
              
//               const SizedBox(height: 12),
              
//               // Truck shipping
//               Container(
//                 padding: const EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                   border: Border.all(color: Colors.grey.shade200),
//                 ),
//                 child: const Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           'Truck',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         const SizedBox(height: 4),
//                         const Text(
//                           'Arrives in 2-4 weeks once shipped',
//                           style: TextStyle(
//                             color: Colors.grey,
//                             fontSize: 14,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const Text('\$102.50'),
//                   ],
//                 ),
//               ),
              
//               const SizedBox(height: 16),
              
//               // Footer text
//               Text(
//                 'Rush shipping may not be available for all orders depending on fulfillment location.',
//                 style: TextStyle(
//                   color: Colors.grey.shade600,
//                   fontSize: 14,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               // Modified footer text section to handle overflow
//               Wrap(
//                 children: [
//                   Text(
//                     'Shipping outside of the Nigeria? See our ',
//                     style: TextStyle(
//                       color: Colors.grey.shade600,
//                       fontSize: 14,
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       // Handle international shipping link tap
//                     },
//                     child: const Text(
//                       'International shipping',
//                       style: TextStyle(
//                         color: Colors.deepPurple,
//                         fontSize: 14,
//                       ),
//                     ),
//                   ),
//                   Text(
//                     ' rates.',
//                     style: TextStyle(
//                       color: Colors.grey.shade600,
//                       fontSize: 14,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 'This item is available for delivery to one of our convenient Collection Points.',
//                 style: TextStyle(
//                   color: Colors.grey.shade600,
//                   fontSize: 14,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }