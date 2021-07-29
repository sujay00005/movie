import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Container(
        margin: EdgeInsets.all(50),
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Company: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Geeksynergy Technologies Pvt Ltd'),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Address: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Sanjaynagar, Bengaluru-56'),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Phone: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('XXXXXXXX09'),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Email :',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'XXXXXX@gmail.com',
                    style: TextStyle(
                        color: Colors.purpleAccent,
                        decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
