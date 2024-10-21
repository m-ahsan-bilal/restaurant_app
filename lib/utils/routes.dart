import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:qasim_milk_shop/auth/login_or_register.dart';
import 'package:qasim_milk_shop/day_18.dart';
import 'package:qasim_milk_shop/landing/splash.dart';
import 'package:qasim_milk_shop/log_register/loginuser.dart';
import 'package:qasim_milk_shop/log_register/register_user.dart';
import 'package:qasim_milk_shop/pages/cart.dart';
import 'package:qasim_milk_shop/pages/dashboard.dart';
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
    path: '/day_18',
    name: "/day_18",
    builder: (BuildContext context, GoRouterState state) => const Day18(),
  ),
  GoRoute(
    path: '/home_dash',
    name: "/home_dash",
    builder: (BuildContext context, GoRouterState state) => const HomeDash(),
  ),
  GoRoute(
    path: '/cart_view',
    name: "/cart_view",
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
];
