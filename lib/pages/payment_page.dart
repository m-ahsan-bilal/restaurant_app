import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
// import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:go_router/go_router.dart';
import 'package:qasim_milk_shop/utils/my_button.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String cardNumber = "";
  String expiryDate = "";
  String cardHolderName = "";
  String cvvCode = "";
  bool isCvvFocused = false;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  // user tappedpay
  void userTappedPay() {
    if (formkey.currentState!.validate()) {
      // only show dialog when form is valid
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text("Are your sure you want to pay?"),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: [
                      Text("Card Number: $cardNumber"),
                      Text("Expiry Date: $expiryDate"),
                      Text("Card Holder Name: $cardHolderName"),
                      Text("Cvv: $cvvCode"),
                    ],
                  ),
                ),
                actions: [
                  // cancel button
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Cancel")),

                  // yes button
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        context.go('/delivery_progress_page');
                      },
                      child: const Text("Yes")),
                ],
              ));
    }
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
            // credit card widget
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              onCreditCardWidgetChange: (p0) {},
            ),

            // credit card form
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CreditCardForm(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                onCreditCardModelChange: (data) {
                  setState(() {
                    cardNumber = data.cardNumber;
                    expiryDate = data.expiryDate;
                    cardHolderName = data.cardHolderName;
                    cvvCode = data.cvvCode;
                  });
                },
                formKey: formkey,
              ),
            ),

            // pay button at the bottom
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: MyButton(
                  onTap: () => context.go('/delivery_progress_page'),
                  // onTap: userTappedPay,

                  title: "Pay Now!"),
            ),
          ],
        ),
      ),
    );
  }
}
