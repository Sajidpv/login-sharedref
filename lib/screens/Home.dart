import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
            tooltip: 'Open Cart',
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notification_important),
          ),
          IconButton(
            onPressed: () {
              signOut(context);
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
    );
  }

  void signOut(ctx) async {
    final _sharedPref = await SharedPreferences.getInstance();
    await _sharedPref.clear();
    Navigator.of(ctx).pushAndRemoveUntil(
      MaterialPageRoute(builder: (ctx) => login()),
      (route) => false,
    );
  }
}
