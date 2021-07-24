import 'package:flutter/material.dart';

import 'package:movie/screens/welcome_screen.dart';
import 'registration_screen.dart';

RegistrationScreen registrationScreen = RegistrationScreen();

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  bool _passwordVisibility = false;
  String? password;
  String? email;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
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
                'Log in to get started',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Experience the all new App!',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black54,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mail_outline),
                  hintText: 'E-Mail ID',
                ),
                controller: emailController,
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    //icon: Image.asset("assets/home.png", color: Colors.grey,),
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

                //icon(lock) Password at end eye icon
              ),
              Spacer(),
              Divider(
                color: Colors.grey,
              ),
              TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.green,
                  ),
                  child: Text(
                    'Login',
                  ),
                  onPressed: () async {
                    bool condition = registrationScreen.checkUser(
                        password: passwordController.text,
                        mail: emailController.text);

                    if (condition == true)
                      try {
                        // final user = await _auth.signInWithEmailAndPassword(
                        //     email: email, password: password);
                        if (true) {
                          Navigator.pushNamed(context, WelcomeScreen.id);
                        }
                      } catch (e) {
                        print(e);
                      }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
