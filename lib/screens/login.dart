import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import 'Home.dart';

class login extends StatefulWidget {
  login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  bool _isMatched = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'User name',
                    hintText: 'Enter username',
                    border: OutlineInputBorder(),
                  ),
                  controller: _usernameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Value is empty';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Pass word',
                    hintText: 'Enter password',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Value is empty';
                    } else {
                      return null;
                    }
                  },
                ),
                Visibility(
                  visible: !_isMatched,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Username and Password doesn\'t match!',
                      style: TextStyle(
                        color: Colors.red.shade700,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      loginCheck(context);
                    }
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void loginCheck(ctx) async {
    final _un = _usernameController.text;
    final _pw = _passwordController.text;

    if (_un == _pw) {
      final _sharedPref = await SharedPreferences.getInstance();
      _sharedPref.setBool(SAVE_KEY, true);
      Navigator.of(ctx).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => const MyHome(),
        ),
      );
    } else {
      setState(() {
        _isMatched = false;
      });
    }
  }
}
