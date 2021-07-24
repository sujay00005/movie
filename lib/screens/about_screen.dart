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
                  Text('Housy'),
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
                  Text('Pune, India'),
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
                    'XXXXXX@housy.com',
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
