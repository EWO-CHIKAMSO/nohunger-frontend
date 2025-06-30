import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nohunger/screen/logistic/ui/change_password.dart';
import 'package:nohunger/screen/logistic/ui/order_card_detail.dart';
import 'package:nohunger/screen/user/components/dashed_divider.dart';
import 'package:nohunger/screen/vendor/ui/order_history_screen.dart';
import 'package:nohunger/screen/vendor/widget/buttomnav.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView( // Added this widget
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 129, 6, 129),
                    Color.fromARGB(255, 231, 28, 28),
                  ],
                ),
              ),
              padding: EdgeInsets.all(10),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Today's Orders",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_forward),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _orderCard("To Do", "3"),
                            _orderCard("Complete", "0"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                children: [
                  SizedBox(height: 16),
                  GestureDetector
                  (
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>orderCardDetail()));
                    },
                    child: OrderHistoryCard(
                      orderId: 'RC00008',
                      pickup: 'Easy Life',
                      delivery: 'KM JASHIM',
                      price: '€1820.0',
                    ),
                  ),
                  SizedBox(height: 16),
                  OrderHistoryCard(
                    orderId: 'RC00008',
                    pickup: 'Easy Life',
                    delivery: 'KM JASHIM',
                    price: '€1820.0',
                  ),
                  SizedBox(height: 16),
                  OrderHistoryCard(
                    orderId: 'RC00008',
                    pickup: 'Easy Life',
                    delivery: 'KM JASHIM',
                    price: '€1820.0',
                  ),
                ],
              
              ),
            ),
   ] )
      
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
          print("Floating Action Button Pressed");
        },
        backgroundColor: Colors.pinkAccent,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _orderCard(String title, String count) {
    return Container(
      width: 140,
      height: 80,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 226, 225, 225),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  Text(
                    count,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.shopping_bag),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class OrderHistoryCard extends StatelessWidget {
  final String orderId;
  final String pickup;
  final String delivery;
  final String price;

  const OrderHistoryCard({
    required this.orderId,
    required this.pickup,
    required this.delivery,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
     decoration: BoxDecoration(
       boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                        borderRadius:BorderRadius.circular(10),
                        color: Colors.white,
                      ),
     
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10),
                            color: Colors.grey.withOpacity(0.2),
                            height: 40,
                            width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Icon(Icons.circle, color: Colors.green, size: 12),
                   SizedBox(width: 5,),
                  Text(
                    'ORDER ID #$orderId',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'VIEW DETAILS',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.ac_unit_outlined),
                Text(pickup, style: TextStyle(color: Colors.grey)),
             
                 Container(
                  height: 1,
                  width: 120,
                  color: Colors.grey,
                 ),
                
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   
                    SizedBox(height: 16),
                    Text(delivery, style: TextStyle(color: Colors.grey)),
                      Icon(Icons.location_pin, color: Colors.red, size: 20),
                  ],
                ),
               
              
               
              ],
            ),
            Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
          
            Text(
              'Dhaka',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            Text(
              'Dhaka Bangladesh',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            ],),
            SizedBox(height: 16),
            LayoutBuilder(
              builder: (context, constraints) {
                double dashWidth = 6.0;
                double dashHeight = 1.5;
                double dashSpace = 4.0;
                int dashCount =
                    (constraints.constrainWidth() / (dashWidth + dashSpace))
                        .floor();
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(dashCount, (_) {
                    return Container(
                      width: dashWidth,
                      height: dashHeight,
                      color: Colors.grey,
                      margin: EdgeInsets.only(right: dashSpace),
                    );
                  }),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text('CASH',style: TextStyle(color: Colors.black),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



// [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(                  
//                       height: 200,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.5),
//                             spreadRadius: 2,
//                             blurRadius: 7,
//                             offset: Offset(0, 1), // changes position of shadow
//                           ),
//                         ],
//                         borderRadius:BorderRadius.circular(10)
//                       ),
//                       child: Column(children: [
//                         Container(
//                           padding: EdgeInsets.all(10),
//                             color: Colors.grey.withOpacity(0.2),
//                             height: 40,
//                             width: double.infinity,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 SizedBox(
//                                   child: Row(
//                                     children: [
//                                       Container(
//                                         height: 12,
//                                         width: 12,
//                                       decoration: BoxDecoration(
//                                         color: Colors.green,
//                                         shape:BoxShape.circle
//                                       ),
//                                       ),
//                                       SizedBox(width: 5,),
//                                       Text("ORDER ID",style: TextStyle(color: Colors.black54,)),
//                                       SizedBox(width: 5,),
//                                       Text("#RC00008",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold))
//                                     ],
//                                   ),
//                                 ),
//                                 InkWell(
//                                   child: Text("View Details"),
//                                 )
//                               ],

//                             ))
                  

//                       ]),
//                     ),
//                   ),