// import 'package:flutter/material.dart';
// // import 'package:flutter_credit_card/flutter_credit_card.dart';
// import 'package:go_router/go_router.dart';
// import 'package:qasim_milk_shop/utils/my_button.dart';

// class PaymentPage extends StatefulWidget {
//   const PaymentPage({super.key});

//   @override
//   State<PaymentPage> createState() => _PaymentPageState();
// }

// class _PaymentPageState extends State<PaymentPage> {
//   String cardNumber = "";
//   String expiryDate = "";
//   String cardHolderName = "";
//   String cvvCode = "";
//   bool isCvvFocused = false;
//   GlobalKey<FormState> formkey = GlobalKey<FormState>();

//   // Payment method selected by user
//   String selectedPaymentMethod = "Credit Card";

//   // user tapped pay
//   void userTappedPay() {
//     if (selectedPaymentMethod == "Credit Card" &&
//         formkey.currentState!.validate()) {
//       // show dialog for credit card payment
//       showPaymentDialog();
//     } else if (selectedPaymentMethod == "Cash on Delivery") {
//       // show dialog for cash on delivery
//       showPaymentDialog(isCashOnDelivery: true);
//     }
//   }

//   // Function to show dialog
//   void showPaymentDialog({bool isCashOnDelivery = false}) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text(isCashOnDelivery
//             ? "Confirm Cash on Delivery"
//             : "Are you sure you want to pay?"),
//         content: SingleChildScrollView(
//           child: ListBody(
//             children: [
//               if (!isCashOnDelivery) ...[
//                 Text("Card Number: $cardNumber"),
//                 Text("Expiry Date: $expiryDate"),
//                 Text("Card Holder Name: $cardHolderName"),
//                 Text("Cvv: $cvvCode"),
//               ] else ...[
//                 const Text("You have chosen Cash on Delivery."),
//               ],
//             ],
//           ),
//         ),
//         actions: [
//           // cancel button
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: const Text("Cancel"),
//           ),

//           // yes button
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//               context.go('/delivery_progress_page');
//             },
//             child: const Text("Yes"),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             context.go('/cart');
//           },
//           icon: const Icon(Icons.arrow_back),
//         ),
//         backgroundColor: Colors.transparent,
//         foregroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: const Text('Checkout'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Payment method selection
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text("Select Payment Method",
//                       style: TextStyle(fontSize: 18)),
//                   ListTile(
//                     title: const Text("Credit Card"),
//                     leading: Radio(
//                       value: "Credit Card",
//                       groupValue: selectedPaymentMethod,
//                       onChanged: (value) {
//                         setState(() {
//                           selectedPaymentMethod = value.toString();
//                         });
//                       },
//                     ),
//                   ),
//                   ListTile(
//                     title: const Text("Cash on Delivery"),
//                     leading: Radio(
//                       value: "Cash on Delivery",
//                       groupValue: selectedPaymentMethod,
//                       onChanged: (value) {
//                         setState(() {
//                           selectedPaymentMethod = value.toString();
//                         });
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             // Show credit card form only if Credit Card is selected
//             if (selectedPaymentMethod == "Credit Card") ...[
//               const Text(
//                 // 'Credit Card Implementation',
//                 "Working on this feature",
//                 style: TextStyle(fontSize: 24),
//               ),
//               // // credit card widget
//               // CreditCardWidget(
//               //   cardNumber: cardNumber,
//               //   expiryDate: expiryDate,
//               //   cardHolderName: cardHolderName,
//               //   cvvCode: cvvCode,
//               //   showBackView: isCvvFocused,
//               //   onCreditCardWidgetChange: (p0) {},
//               // ),

//               // // credit card form
//               // Padding(
//               //   padding: const EdgeInsets.all(16.0),
//               //   child: CreditCardForm(
//               //     cardNumber: cardNumber,
//               //     expiryDate: expiryDate,
//               //     cardHolderName: cardHolderName,
//               //     cvvCode: cvvCode,
//               //     onCreditCardModelChange: (data) {
//               //       setState(() {
//               //         cardNumber = data.cardNumber;
//               //         expiryDate = data.expiryDate;
//               //         cardHolderName = data.cardHolderName;
//               //         cvvCode = data.cvvCode;
//               //       });
//               //     },
//               //     formKey: formkey,
//               //   ),
//               // ),
//             ],

//             // pay button at the bottom
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 20.0),
//               child: MyButton(
//                   onTap: userTappedPay,
//                   title: selectedPaymentMethod == "Credit Card"
//                       ? "Pay Now!"
//                       : "Place Order"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:qasim_milk_shop/utils/my_button.dart';

// class PaymentPage extends StatefulWidget {
//   const PaymentPage({super.key});

//   @override
//   State<PaymentPage> createState() => _PaymentPageState();
// }

// class _PaymentPageState extends State<PaymentPage> {
//   // Payment method selected by user
//   String selectedPaymentMethod = "Credit Card";

//   // user tapped pay
//   void userTappedPay() {
//     if (selectedPaymentMethod == "Cash on Delivery") {
//       // show dialog for cash on delivery
//       showPaymentDialog(isCashOnDelivery: true);
//     }
//   }

//   // Function to show dialog
//   void showPaymentDialog({bool isCashOnDelivery = false}) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text(isCashOnDelivery
//             ? "Confirm Cash on Delivery"
//             : "Payment Method Selected"),
//         content: SingleChildScrollView(
//           child: ListBody(
//             children: [
//               if (isCashOnDelivery) ...[
//                 const Text("You have chosen Cash on Delivery."),
//               ],
//             ],
//           ),
//         ),
//         actions: [
//           // cancel button
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: const Text("Cancel"),
//           ),

//           // yes button
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//               context.go('/delivery_progress_page');
//             },
//             child: const Text("Yes"),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             context.go('/cart');
//           },
//           icon: const Icon(Icons.arrow_back),
//         ),
//         backgroundColor: Colors.transparent,
//         foregroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: const Text('Checkout'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Payment method selection
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text("Select Payment Method",
//                       style: TextStyle(fontSize: 18)),
//                   ListTile(
//                     title: const Text("Credit Card"),
//                     leading: Radio(
//                       value: "Credit Card",
//                       groupValue: selectedPaymentMethod,
//                       onChanged: (value) {
//                         setState(() {
//                           selectedPaymentMethod = value.toString();
//                         });
//                       },
//                     ),
//                   ),
//                   ListTile(
//                     title: const Text("Cash on Delivery"),
//                     leading: Radio(
//                       value: "Cash on Delivery",
//                       groupValue: selectedPaymentMethod,
//                       onChanged: (value) {
//                         setState(() {
//                           selectedPaymentMethod = value.toString();
//                         });
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             // Show message for credit card selection
//             if (selectedPaymentMethod == "Credit Card") ...[
//               const Text(
//                 "This feature is currently under development.",
//                 style: TextStyle(fontSize: 24, color: Colors.red),
//                 textAlign: TextAlign.center,
//               ),
//             ],

//             // pay button at the bottom
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 20.0),
//               child: MyButton(
//                 onTap: selectedPaymentMethod == "Cash on Delivery"
//                     ? userTappedPay
//                     : null, // Disable button if Credit Card is selected
//                 title: selectedPaymentMethod == "Cash on Delivery"
//                     ? "Place Order"
//                     : "Feature Unavailable",
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/my_button.dart';
import 'package:go_router/go_router.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  // Payment method selected by user
  String selectedPaymentMethod = "Credit Card";

  // User tapped pay
  void userTappedPay() {
    if (selectedPaymentMethod == "Cash on Delivery") {
      showPaymentDialog(isCashOnDelivery: true);
    }
    // Add credit card handling when implemented
  }

  // Function to show dialog
  void showPaymentDialog({bool isCashOnDelivery = false}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isCashOnDelivery
            ? "Confirm Cash on Delivery"
            : "Payment Method Selected"),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              if (isCashOnDelivery) ...[
                const Text("You have chosen Cash on Delivery."),
              ],
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              context.go('/delivery_progress_page');
            },
            child: const Text("Yes"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.go('/cart');
          },
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Checkout'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Select Payment Method",
                      style: TextStyle(fontSize: 18)),
                  ListTile(
                    title: const Text("Credit Card"),
                    leading: Radio(
                      value: "Credit Card",
                      groupValue: selectedPaymentMethod,
                      onChanged: (value) {
                        setState(() {
                          selectedPaymentMethod = value.toString();
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text("Cash on Delivery"),
                    leading: Radio(
                      value: "Cash on Delivery",
                      groupValue: selectedPaymentMethod,
                      onChanged: (value) {
                        setState(() {
                          selectedPaymentMethod = value.toString();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            if (selectedPaymentMethod == "Credit Card") ...[
              const Text(
                "This feature is currently under development.",
                style: TextStyle(fontSize: 24, color: Colors.red),
                textAlign: TextAlign.center,
              ),
            ],
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: MyButton(
                onTap: selectedPaymentMethod == "Cash on Delivery"
                    ? userTappedPay
                    : null,
                title: selectedPaymentMethod == "Cash on Delivery"
                    ? "Place Order"
                    : "Feature Unavailable",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
