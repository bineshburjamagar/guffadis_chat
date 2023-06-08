import 'package:flutter/material.dart';
import 'package:guffadis_chat/ui/config/app_colors.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);
  static const String routeName = "/onboardingpage";
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const OnboardingPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: AppColors.darkPrimary,
          gradient: RadialGradient(
            tileMode: TileMode.clamp,
            colors: [
              AppColors.primaryColor,
              AppColors.darkPrimary,
            ],
          ),
        ),
      ),
    );
  }
}
