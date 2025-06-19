// import 'package:flutter/material.dart';



import 'package:flutter/material.dart';


class orderCardDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 244, 244),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Text('Order Details'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Chip(
              label: Text('Delivering'),
              backgroundColor: Colors.blue[100],
              labelStyle: TextStyle(color: Colors.blue),
            ),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order ID and Details
            Container(
           padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                
                   color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(
                    'ORDER ID #RC000023',
                    style: TextStyle(fontSize: 18,color: Colors.black, fontWeight: FontWeight.bold),
                  ),

                   SizedBox(height: 16),
            Container(
              color: Colors.grey.withOpacity(0.2),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Paid', style: TextStyle(color: Colors.grey)),
                        SizedBox(height: 4),
                         Text('Delivery Between', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(
                          '€570.0',
                          style: TextStyle(
                              fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      
                        SizedBox(height: 4),
                        Text(
                          '01 Feb, 2025',
                          style: TextStyle(
                              fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
                ],
              ),
            ),
           
            SizedBox(height: 24),
            // Shipping Info
            Text(
              'Shipping Info',
              style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.red[300]!),
                borderRadius: BorderRadius.circular(10),
              
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.circle, color: Colors.grey, size: 12),
                      Container(
                        height: 200,
                        width: 1,
                        color: Colors.grey[300],
                        margin: EdgeInsets.symmetric(vertical: 4),
                      ),
                      Icon(Icons.location_pin, color: Colors.red, size: 20),
                    ],
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              
                                SizedBox(height: 4),
                                Row(
                                  children: [
                                       CircleAvatar(
                                      radius: 20,  // Increased from 12 to 24
                                      backgroundImage: NetworkImage(
                                        'https://picsum.photos/150'),
                                        // Random placeholder image from Lorem Picsum
                                      ),
                                      SizedBox(width: 8),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                          Text('PICK UP',style:TextStyle(color: Colors.grey.shade800),),
                                        Row(
                                          children: [
                                            Text(
                                              'Easy Life ',
                                              style: TextStyle( color: Colors.black,fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              ' (01100088800)',
                                              style: TextStyle(fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        Text('Dhaka Bangladesh'),
                                      ],
                                    ),
                                  ],
                                ),
                                
                        
                              ],
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text('Call', style: TextStyle(color: Colors.red)),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        // Map Placeholder
                         Column(
                           children: [
                             Container(
                                           height: 150,
                                           decoration: BoxDecoration(
                                             border: Border.all(color: Colors.grey[300]!),
                                             borderRadius: BorderRadius.circular(10),
                                             
                                           ),
                                           child: Stack(
                                             children: [
                                               Center(
                                                 child: Text(
                                                   'Map Placeholder\n(Use google_maps_flutter for actual map)',
                                                   textAlign: TextAlign.center,
                                                   style: TextStyle(color: Colors.grey),
                                                 ),
                                               ),
                                              Positioned(
  bottom: 8,
  left: 8,
  child: Image.network(
  'https://upload.wikimedia.org/wikipedia/commons/5/56/Enugu_skyline.jpg',
  height: 200,
  width: double.infinity,
  fit: BoxFit.cover,
)


),

                                               Positioned(
                                                 bottom: 8,
                                                 right: 8,
                                                 child: ElevatedButton(
                                                   onPressed: () {},
                                                   style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                                                   child: Text('Get Direction'),
                                                 ),
                                               ),
                                             ],
                                           ),
                                         ),
                           ],
                         ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('DROP OFF'),
                                SizedBox(height: 4),
                                Row(
                                  children: [
                                   
                                    SizedBox(width: 8),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'KM JASHIM 1711327259',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                            '675, Dhaka, Dhaka, Dhaka, 1206\nSociety Jame Masjid'),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            IconButton(
                              icon: Icon(Icons.phone, color: Colors.red),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            // Map Placeholder
           
            Spacer(),
            // Slide to Confirm Delivery Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.arrow_forward),
                label: Text('Slide to Confirm Delivery'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}







// class orderCardDetail extends StatefulWidget {
//   const orderCardDetail({super.key});

//   @override
//   State<orderCardDetail> createState() => _orderCardDetailState();
// }

// class _orderCardDetailState extends State<orderCardDetail> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Order Details"),
//         actions: [
//           Container(
//             margin: EdgeInsets.only(right: 20),
//             decoration: BoxDecoration(
//               color: const Color.fromARGB(255, 251, 117, 0),
//               borderRadius: BorderRadius.circular(15)
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text("Active",style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold
//               ),),
//             ))
//         ],
//       ),

//       body: Column(
//         children: [
//           Container(
//             width: 325,
//             decoration:  BoxDecoration(
//               color: Colors.white,
              
//             ),
//           )
//         ],
//       ),
    
//     );
//   }
// }