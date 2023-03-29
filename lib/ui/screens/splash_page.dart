import 'package:flutter/material.dart';
import 'package:guffadis_chat/ui/config/config.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

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
          )
        ],
      ),
    );
  }
}
