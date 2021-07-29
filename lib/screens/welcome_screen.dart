import 'package:flutter/material.dart';
import 'package:movie/screens/about_screen.dart';
import 'package:movie/networking.dart';
import 'package:movie/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  //static String id = 'welcome_screen';
  const WelcomeScreen({required this.prefs});
  final SharedPreferences prefs;

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    NetworkHelper().postData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Movie'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return AboutScreen();
                }),
              );
            },
            icon: Icon(Icons.info_outline),
          )
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Text('Hi there, Posting data to the API'),
          ),

          //removing local data on logout
          TextButton(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.remove('email');
              prefs.remove('password');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen(prefs: widget.prefs);
                  },
                ),
              );
            },
            child: Text('Logout'),
          ),
        ],
      ),
    );
  }
}
