import 'package:flutter/material.dart';
import 'package:guffadis_chat/ui/screens/onboarding_page.dart';

class AppRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case OnboardingPage.routeName:
        return OnboardingPage.route();

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('Not Found'),
            ),
          ),
        );
    }
  }
}
