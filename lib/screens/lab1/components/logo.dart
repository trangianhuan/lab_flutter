import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 200,
      ),
      child: Column(
        children: [
          Image.asset('assets/images/connexion_logo.jpg'),
          const Text(
            'Find and Meet people around you to find LOVE',
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xFFFFD6CA)),
          ),
          // Text('you to find LOVE'),
        ],
      ),
    );
  }
}
