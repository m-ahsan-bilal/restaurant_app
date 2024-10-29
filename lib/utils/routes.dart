import 'package:flutter/material.dart';
import 'package:food_delivery_app/admin/admin_dashboard.dart';
import 'package:food_delivery_app/admin/receipt_details.dart';
import 'package:food_delivery_app/admin/view_orders.dart';
import 'package:food_delivery_app/firebase_services/auth/login_or_register.dart';
import 'package:food_delivery_app/landing/splash.dart';
import 'package:food_delivery_app/log_register/loginuser.dart';
import 'package:food_delivery_app/log_register/register_user.dart';
import 'package:food_delivery_app/pages/cart.dart';
import 'package:food_delivery_app/pages/dashboard.dart';
import 'package:food_delivery_app/pages/delivery_progress_page.dart';
import 'package:food_delivery_app/pages/payment_page.dart';
import 'package:food_delivery_app/pages/settings.dart';
import 'package:food_delivery_app/pages/user_profile.dart';

import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final GoRouter basicRoutes = GoRouter(
  debugLogDiagnostics: true,
  navigatorKey: navigatorKey,
  initialLocation: "/",
  routes: appRoutesList,
  errorBuilder: (context, state) => Center(
    child: Container(
      color: Colors.white,
      child: Text(
        state.error.toString(),
      ),
    ),
  ),
);
List<RouteBase> appRoutesList = [
  GoRoute(
    path: '/',
    name: "/",
    builder: (BuildContext context, GoRouterState state) =>
        const SplashScreen(),
  ),
  GoRoute(
    path: '/home_dash',
    name: "/home_dash",
    builder: (BuildContext context, GoRouterState state) => const HomeDash(),
  ),
  GoRoute(
    path: '/admin_dashboard',
    name: "//admin_dashboard",
    builder: (BuildContext context, GoRouterState state) =>
        const AdminDashboard(),
  ),
  GoRoute(
    path: '/cart',
    name: "cart",
    builder: (BuildContext context, GoRouterState state) => const Cart(),
  ),
  GoRoute(
    path: '/user_view',
    name: "/user_view",
    builder: (BuildContext context, GoRouterState state) => const UserProfile(),
  ),
  GoRoute(
    path: '/login_user',
    name: "/login_user",
    builder: (BuildContext context, GoRouterState state) => LoginUser(
      onTap: () {},
    ),
  ),
  GoRoute(
    path: '/register_user',
    name: "/register_user",
    builder: (BuildContext context, GoRouterState state) =>
        const RegisterUser(),
  ),
  GoRoute(
    path: '/login_register',
    name: "/login_register",
    builder: (BuildContext context, GoRouterState state) =>
        const LoginOrRegister(),
  ),
  GoRoute(
    path: '/settings',
    name: "settings",
    builder: (BuildContext context, GoRouterState state) =>
        const SettingsPage(),
  ),
  GoRoute(
    path: '/checkout',
    name: "checkout",
    builder: (BuildContext context, GoRouterState state) => const PaymentPage(),
  ),
  GoRoute(
    path: '/delivery_progress_page',
    name: "delivery_progress_page",
    builder: (BuildContext context, GoRouterState state) =>
        const DeliveryProgressPage(),
  ),
  GoRoute(
    path: '/view_orders',
    name: "view_orders",
    builder: (BuildContext context, GoRouterState state) => const ViewOrders(),
  ),
  GoRoute(
    path: '/receipt_details',
    name: "receipt_details",
    builder: (BuildContext context, GoRouterState state) {
      // Retrieve the orderData from the state
      final orderData = state.extra as Map<String, dynamic>?;

      // Pass the orderData to the ReceiptDetails widget
      return ReceiptDetails(orderData: orderData!);
    },
  ),
];
