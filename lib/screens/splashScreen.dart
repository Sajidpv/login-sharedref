import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import 'Home.dart';
import 'login.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    checkUserLogged(context);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/Loading_2.gif'),
            Text(
              'Loading...',
              style: TextStyle(
                fontSize: 40,
                color: Colors.blueAccent.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> gotoLogin(context) async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (ctx) => login(),
    ));
  }

  Future<void> checkUserLogged(ctx) async {
    final _sharedPref = await SharedPreferences.getInstance();
    final _userLogged = _sharedPref.getBool(SAVE_KEY);

    if (_userLogged == null || _userLogged == false) {
      gotoLogin(context);
    } else {
      Navigator.of(ctx).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => const MyHome(),
        ),
      );
    }
  }
}
