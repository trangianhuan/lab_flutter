import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lab_flutter/screens/lab1/components/logo.dart';
import 'package:lab_flutter/screens/lab1/sign_up.dart';

import 'components/button_circle.dart';
import 'components/input_text.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool checkedValue = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFFE7348),
            Color(0xFFF6366B),
          ],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(0.0, 1.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: Container(
          height: 52,
          color: const Color(0xFFD42053),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Don\'t have account ? ',
                style: TextStyle(
                  color: Color(0xFFFF8F50),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUp()),
                  );
                },
                child: Text(
                  'Sign Up'.toUpperCase(),
                  style: const TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 10,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(24),
            child: Center(
              child: Column(
                children: [
                  Logo(),
                  const SizedBox(height: 24),
                  Text(
                    'Sign In'.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const InputText(hint: 'Enter Email'),
                  const SizedBox(height: 36),
                  const InputText(hint: 'Password'),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        activeColor: const Color(0xFFFE7348),
                        value: checkedValue,
                        // onChanged: (bool? value) {},
                        onChanged: (newValue) {
                          setState(() {
                            checkedValue = newValue!;
                          });
                        },
                      ),
                      const Text(
                        "Remember Password",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFFFFD6CA),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: Text(
                        'Get Started'.toUpperCase(),
                        style: const TextStyle(
                          color: Color(0xFFFE7348),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        padding: const EdgeInsets.all(24),
                        shape: const StadiumBorder(),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      ButtonCircle(iconData: FontAwesomeIcons.facebookF),
                      SizedBox(width: 8),
                      ButtonCircle(iconData: FontAwesomeIcons.twitter),
                    ],
                  ),
                  const SizedBox(height: 16),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Forgot Password?'.toUpperCase(),
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 10,
                        color: Color(0xFFFFD6CA),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
