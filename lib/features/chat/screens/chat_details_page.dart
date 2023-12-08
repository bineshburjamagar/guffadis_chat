import 'package:flutter/material.dart';
import 'package:guffadis_chat/features/chat/widgets/export_widgets.dart';
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
    return Scaffold(
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
    );
  }
}
