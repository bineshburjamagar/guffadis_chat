import 'package:flutter/material.dart';
import 'package:guffadis_chat/ui/config/config.dart';
import 'package:guffadis_chat/ui/ui.dart';

void main() {
  runApp(const MyApp());
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
