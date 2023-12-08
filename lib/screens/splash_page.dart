import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:guffadis_chat/config/config.dart';
import 'package:guffadis_chat/screens/onboarding_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    initializeApp();
  }

  initializeApp() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, OnboardingPage.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              AssetsPath.logo,
              height: 200,
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'Guffadis\'s',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 40.0,
                fontFamily: 'Sen',
              ),
              children: [
                TextSpan(
                  text: '  Chat',
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 40.0,
                      fontFamily: 'Sen'),
                ),
              ],
            ),
          ).animate().shimmer(delay: 500.ms, duration: 1500.ms).scale()
        ],
      ),
    );
  }
}
