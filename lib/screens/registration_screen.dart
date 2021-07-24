import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie/screens/welcome_screen.dart';
import 'login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? localStorage;
String? _password;
String? email;

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();

  bool checkUser({required String password, required String mail}) {
    return (password == _password && mail == email) ? true : false;
  }
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool _passwordVisibility = false;
  String selectedOccupation = 'Engineer';

  Future<SharedPreferences> prefs = SharedPreferences.getInstance();

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
                    onChanged: (value) {
                      email = value;
                    },
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
                    onChanged: (value) {
                      _password = value;
                    },
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
                        _password = passwordController.text;
                        email = emailController.text;
                        // name = nameController.text;
                        // mobile = mobileController.text;

                        try {
                          if (_password == '' ||
                              email == '' ||
                              nameController.text == '' ||
                              mobileController.text == '') {
                            print('Wrong credentials');
                          } else {
                            localStorage!
                                .setString('email', emailController.text);
                            localStorage!
                                .setString('password', passwordController.text);
                            localStorage!
                                .setString('name', nameController.text);
                            localStorage!
                                .setString('mobile', mobileController.text);
                            localStorage!
                                .setString('occupation', selectedOccupation);

                            Navigator.pushNamed(context, LoginScreen.id);

                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) {
                            //       return WelcomeScreen();
                            //     },
                            //   ),
                            // );
                          }
                        } catch (error) {
                          print(error);
                        }
                      }),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Already have an account?',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, LoginScreen.id);
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
