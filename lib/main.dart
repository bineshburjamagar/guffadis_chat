import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'config/app_routes.dart';
import 'screens/splash_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guffadis Chat',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoute.onGenerateRoute,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'Sen',
      ),
      home: const SplashPage(),
    );
  }
}
