import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lab_flutter/screens/lab1/components/button_circle.dart';
import 'package:lab_flutter/screens/lab1/components/logo.dart';

import 'components/button_circle_icon.dart';

class SignUp extends StatelessWidget {
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
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(24),
            child: Center(
              child: Column(
                children: [
                  Logo(),
                  const SizedBox(height: 24),
                  const SizedBox(height: 24),
                  const ButtonCircleIcon(
                    iconData: FontAwesomeIcons.facebookF,
                    labelText: 'Sign in with Facebook',
                  ),
                  const SizedBox(height: 24),
                  const ButtonCircleIcon(
                    iconData: FontAwesomeIcons.twitter,
                    labelText: 'Sign in with Twitter',
                  ),
                  const SizedBox(height: 24),
                  const ButtonCircle(
                    labelText: 'Sign Up',
                    width: double.infinity,
                    shape: StadiumBorder(),
                  ),
                  const SizedBox(height: 24),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'ALREADY REGISTERED? SIGN IN',
                      style: TextStyle(
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
