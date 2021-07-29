import 'package:flutter/material.dart';
import 'package:movie/screens/login_screen.dart';
import 'package:movie/screens/registration_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

var email;
var password;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  email = prefs.getString('email');
  password = prefs.getString('password');
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.green,
    ),
    home: email == null
        ? RegistrationScreen(prefs: prefs)
        : LoginScreen(prefs: prefs),
  ));
}
