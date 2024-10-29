// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:intl/intl.dart'; // Import intl package for date formatting
// import 'package:qasim_milk_shop/admin/get_firestore.dart';

// class ViewOrders extends StatefulWidget {
//   const ViewOrders({super.key});

//   @override
//   State<ViewOrders> createState() => _ViewOrdersState();
// }

// class _ViewOrdersState extends State<ViewOrders> {
//   final OrderService _orderService = OrderService();

//   // Function to format date
//   String formatDate(Timestamp timestamp) {
//     final date = timestamp.toDate();
//     final DateFormat formatter = DateFormat('dd MMM yyyy, hh:mm a');
//     return formatter.format(date);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.surface,
//       appBar: AppBar(
//         leading: IconButton(
//             onPressed: () {
//               context.go('/admin_dashboard');
//             },
//             icon: Icon(Icons.arrow_back)),
//         title: const Text(
//           "View Orders",
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//           ),
//         ),
//         backgroundColor: Colors.transparent,
//         centerTitle: true,
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: _orderService.getOrdersStream(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.hasError) {
//             return const Center(child: Text('Error fetching orders'));
//           }

//           if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//             return const Center(child: Text('No orders found'));
//           }

//           // Get the list of orders and reverse it for display
//           List<DocumentSnapshot> orders = snapshot.data!.docs.reversed.toList();

//           // Display list of orders
//           return ListView.builder(
//             padding: const EdgeInsets.all(8.0),
//             itemCount: orders.length,
//             itemBuilder: (context, index) {
//               DocumentSnapshot orderDoc = orders[index];
//               Map<String, dynamic> orderData =
//                   orderDoc.data() as Map<String, dynamic>;

//               // Create order number starting from 1
//               int orderNumber =
//                   orders.length - index; // Number from oldest to newest

//               return Padding(
//                 padding:
//                     const EdgeInsets.only(bottom: 8.0), // Space between cards
//                 child: Card(
//                   elevation: 3,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   margin: const EdgeInsets.symmetric(vertical: 8.0),
//                   child: ListTile(
//                     contentPadding: const EdgeInsets.all(16.0),
//                     title: Text(
//                       'Order #$orderNumber: ${orderData['order'] ?? 'N/A'}',
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                       ),
//                     ),
//                     subtitle: Text(
//                       'Date: ${formatDate(orderData['data'])}',
//                       style: const TextStyle(
//                         color: Colors.black54,
//                       ),
//                     ),
//                     onTap: () {
//                       // Navigate to order details or take action
//                     },
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/admin/get_firestore.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class ViewOrders extends StatefulWidget {
  const ViewOrders({super.key});

  @override
  State<ViewOrders> createState() => _ViewOrdersState();
}

class _ViewOrdersState extends State<ViewOrders> {
  final OrderService _orderService = OrderService();

  String formatDate(Timestamp timestamp) {
    final date = timestamp.toDate();
    final DateFormat formatter = DateFormat('dd MMM yyyy, hh:mm a');
    return formatter.format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.go('/admin_dashboard');
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          "View Orders",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: _orderService
            .getOrdersWithUserDataStream(), // Update to the new method
        builder: (BuildContext context,
            AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Error fetching orders'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No orders found'));
          }

          // Get the list of orders
          List<Map<String, dynamic>> ordersWithUsers = snapshot.data!;

          return ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: ordersWithUsers.length,
            itemBuilder: (context, index) {
              var orderData = ordersWithUsers[index]['order'];
              var userData = ordersWithUsers[index]['user'];

              int orderNumber = ordersWithUsers.length - index;

              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16.0),
                    title: Text(
                      'Order #$orderNumber: ${orderData['order'] ?? 'N/A'}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      'User: ${userData?['name'] ?? 'N/A'}, Date: ${formatDate(orderData['orderDate'])}',
                      style: const TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                    onTap: () {
                      context.go('/receipt_details',
                          extra: orderData); // Navigate to receipt details
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
