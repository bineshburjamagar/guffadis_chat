import 'package:flutter/material.dart';
import 'package:guffadis_chat/config/config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widgets/user_chat_text.dart';

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
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 23.0),
        child: Column(
          children: [
            UserChatText(),
          ],
        ),
      ),
    );
  }
}
