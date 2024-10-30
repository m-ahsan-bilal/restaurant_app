import 'package:flutter/material.dart';

class MyDescriptionBox extends StatefulWidget {
  const MyDescriptionBox({super.key});

  @override
  State<MyDescriptionBox> createState() => _MyDescriptionBoxState();
}

class _MyDescriptionBoxState extends State<MyDescriptionBox>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true); // Repeats animation to create a blinking effect

    _opacityAnimation =
        Tween<double>(begin: 1.0, end: 0.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var myPrimaryTextStyle =
        TextStyle(color: Theme.of(context).colorScheme.inversePrimary);
    var mySecondaryTextStyle = TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontWeight: FontWeight.bold);

    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.secondary),
          borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                "Delivery Fee",
                style: mySecondaryTextStyle,
              ),
              FadeTransition(
                opacity: _opacityAnimation,
                child: Text(
                  "Free",
                  style: myPrimaryTextStyle,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                "Delivery time",
                style: mySecondaryTextStyle,
              ),
              Text(
                "30-40 minutes",
                style: myPrimaryTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
