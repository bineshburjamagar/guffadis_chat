import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChatListPage extends HookConsumerWidget {
  const ChatListPage({super.key});
  static const String routeName = "/chatlistpage";
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const ChatListPage());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(40.0),
          ),
        ),
        child: ListView.builder(
            padding: const EdgeInsets.only(top: 20.0),
            itemBuilder: (context, index) {
              return const ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 23.0),
                leading: CircleAvatar(
                  child: Text('RJ'),
                ),
                title: Text(
                  'Ram Ji',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text(
                  'Hello babe',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                isThreeLine: true,
                trailing: Text(
                  '1 min ago',
                  textAlign: TextAlign.center,
                ),
              );
            },
            itemCount: 10),
      ),
    );
  }
}
