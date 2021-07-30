import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie/screens/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screen.dart';

String? email;
String? password;

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({required this.prefs});
  final SharedPreferences prefs;

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool _passwordVisibility = false;
  String selectedOccupation = 'Engineer';

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  late Future<String> professionController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Sign up to get started',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_outline),
                      hintText: 'Name',
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    //icon E-mail ID
                    keyboardType: TextInputType.emailAddress,

                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.mail_outline),
                      hintText: 'E-Mail ID',
                    ),
                    controller: emailController,
                    // onChanged: (value) {
                    //   email = value;
                    // },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      hintText: 'Phone Number',
                    ),
                    controller: mobileController,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        hintText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _passwordVisibility
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisibility = !_passwordVisibility;
                            });
                          },
                        )),
                    obscureText: _passwordVisibility ? false : true,
                    textAlign: TextAlign.left,
                    controller: passwordController,
                    // onChanged: (value) {
                    //   _password = value;
                    // },
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  SizedBox(
                    width: 350.0,
                    child: DropdownButton<String>(
                      value: selectedOccupation,
                      items: <String>[
                        'Engineer',
                        'Doctor',
                        'Businessman',
                        'Accountant',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          selectedOccupation = value!;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextButton(
                      child: Text(
                        'SIGN UP',
                      ),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.green,
                        elevation: 5.0,
                      ),
                      onPressed: () {
                        password = passwordController.text;
                        email = emailController.text;

                        try {
                          if (passwordController.text == '' ||
                              emailController.text == '' ||
                              nameController.text == '' ||
                              mobileController.text == '') {
                            print('Wrong credentials');
                          } else {
                            widget.prefs
                                .setString('email', emailController.text);
                            widget.prefs
                                .setString('password', passwordController.text);
                            widget.prefs.setString('name', nameController.text);
                            widget.prefs
                                .setString('mobile', mobileController.text);
                            widget.prefs
                                .setString('occupation', selectedOccupation);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return WelcomeScreen(prefs: widget.prefs);
                                },
                              ),
                            );
                          }
                        } catch (error) {
                          print(error);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return LoginScreen(prefs: widget.prefs);
                              },
                            ),
                          );
                        }
                      }),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Already logged into an account?',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return LoginScreen(prefs: widget.prefs);
                              },
                            ),
                          );
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
