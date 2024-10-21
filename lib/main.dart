import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qasim_milk_shop/firebase_options.dart';
import 'package:qasim_milk_shop/models/restaurant.dart';
import 'package:qasim_milk_shop/themes/theme_provider.dart';
import 'package:qasim_milk_shop/utils/routes.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Restaurant()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Restaurant App',
        routerConfig: basicRoutes,
        theme: Provider.of<ThemeProvider>(context).themeData,
      );
    });
  }
}
