import 'package:flutter/material.dart';
import 'package:login_page_flut_ui/screens/splashScreen.dart';

void main() => runApp(const MyApp());

const SAVE_KEY = 'user_Logged';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LoginApp',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const splash(),
    );
  }
}
