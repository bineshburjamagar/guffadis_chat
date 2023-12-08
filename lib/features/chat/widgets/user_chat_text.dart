import 'package:flutter/material.dart';
import 'package:guffadis_chat/config/config.dart';

class UserChatText extends StatelessWidget {
  const UserChatText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        decoration: BoxDecoration(
          color: AppColors.greenColor,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              topLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0)),
        ),
        child: const Text(
          'hello ramujiiii',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
