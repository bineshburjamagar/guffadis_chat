import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:guffadis_chat/config/config.dart';
import 'package:guffadis_chat/features/chat/widgets/export_widgets.dart';
import 'package:guffadis_chat/ui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChatDetailsPage extends HookConsumerWidget {
  const ChatDetailsPage({super.key});
  static const String routeName = "/chatdetailspage";
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const ChatDetailsPage());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatController = useTextEditingController();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Row(
            children: [
              CircleAvatar(
                child: Text('RJ'),
              ),
              SizedBox(width: 10.0),
              Text('Ram Ji'),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 23.0),
          child: Column(
            children: [
              UserChatBubble(),
              SenderUserChatBubble(),
            ],
          ),
        ),
        bottomSheet: BottomSheet(
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
                    child: CustomTextField(
                      controller: chatController,
                      labelText: '',
                      hintText: 'Write your message',
                      suffixIcon: chatController.text.isNotEmpty
                          ? const Text('data')
                          : null,
                    ),
                  );
                })
              ],
            );
          },
        ),
      ),
    );
  }
}
