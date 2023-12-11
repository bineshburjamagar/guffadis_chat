import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:guffadis_chat/config/config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../ui.dart';

class CustomMessageSendButton extends HookConsumerWidget {
  const CustomMessageSendButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatController = useState<String>('');

    return BottomSheet(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(),
      onClosing: () {},
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Divider(
              color: AppColors.lightGreenColor,
            ),
            Builder(builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    // const Padding(
                    //   padding: EdgeInsets.all(8.0),
                    //   child: Icon(
                    //     Icons.attachment_sharp,
                    //     size: 30.0,
                    //   ),
                    // ),
                    Expanded(
                      child: CustomTextField(
                        initialValue: chatController.value,
                        labelText: '',
                        hintText: 'Write your message',
                        onChanged: (v) => chatController.value = v,
                      ),
                    ),

                    if (chatController.value.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: AppColors.primaryColor,
                          child: const Center(
                            child: Icon(
                              Icons.send,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                  ],
                ),
              );
            })
          ],
        );
      },
    );
  }
}
