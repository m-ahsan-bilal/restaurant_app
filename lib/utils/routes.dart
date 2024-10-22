import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:qasim_milk_shop/firebase_services/auth/login_or_register.dart';
import 'package:qasim_milk_shop/landing/splash.dart';
import 'package:qasim_milk_shop/log_register/loginuser.dart';
import 'package:qasim_milk_shop/log_register/register_user.dart';
import 'package:qasim_milk_shop/pages/cart.dart';
import 'package:qasim_milk_shop/pages/dashboard.dart';
import 'package:qasim_milk_shop/pages/delivery_progress_page.dart';
import 'package:qasim_milk_shop/pages/payment_page.dart';
import 'package:qasim_milk_shop/pages/settings.dart';
import 'package:qasim_milk_shop/pages/user_profile.dart';

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
];
