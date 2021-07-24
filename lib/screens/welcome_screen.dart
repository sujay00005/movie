import 'package:flutter/material.dart';
import 'package:movie/screens/about_screen.dart';
import 'package:movie/networking.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  const WelcomeScreen({Key? key}) : super(key: key);

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
      body: Center(
        child: Column(
          children: [
            Text('Hi there, Posting data to the API'),
          ],
        ),
      ),
    );
  }
}
