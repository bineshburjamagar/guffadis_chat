import 'package:flutter/material.dart';
import 'package:guffadis_chat/config/config.dart';

class SenderUserChatBubble extends StatelessWidget {
  const SenderUserChatBubble({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          radius: 26.0,
          child: Text('RJ'),
        ),
        const SizedBox(width: 10.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Ram Ji',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                decoration: BoxDecoration(
                  color: AppColors.lightGreenColor,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0)),
                ),
                child: const Text(
                  'Hajur daju bhaanisyooo lllllllllllllllllllllll',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
