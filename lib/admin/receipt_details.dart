import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class ReceiptDetails extends StatelessWidget {
  final Map<String, dynamic> orderData;

  const ReceiptDetails({super.key, required this.orderData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.go('/view_orders');
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          "Details",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order: ${orderData['order'] ?? 'N/A'}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Date: ${orderData['data'] != null ? formatDate(orderData['data']) : 'N/A'}',
              style: const TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 16.0),
            // Add more details here as needed
          ],
        ),
      ),
    );
  }

  String formatDate(Timestamp timestamp) {
    final date = timestamp.toDate();
    final DateFormat formatter = DateFormat('dd MMM yyyy, hh:mm a');
    return formatter.format(date);
  }
}
