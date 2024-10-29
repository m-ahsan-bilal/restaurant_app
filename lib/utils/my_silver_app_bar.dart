import 'package:flutter/material.dart';
import 'package:food_delivery_app/user/user_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MySilverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;
  const MySilverAppBar({super.key, required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    String? userName = Provider.of<UserProvider>(context).userName;
    return SliverAppBar(
      expandedHeight: 350,
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      actions: [
        IconButton(
            onPressed: () {
              context.go('/cart');
            },
            icon: const Icon(Icons.shopping_cart))
      ],
      backgroundColor: Theme.of(context).colorScheme.surface,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text(userName ?? ""),
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: child,
        ),
        title: title,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(left: 0, top: 0, right: 0),
        expandedTitleScale: 1,
      ),
    );
  }
}
