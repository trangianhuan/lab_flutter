import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String hint;
  const InputText({
    required this.hint,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFFFD6CA),
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFFFD6CA),
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFFFD6CA),
          ),
        ),
        labelText: hint,
        labelStyle: const TextStyle(
          color: Color(0xFFFFD6CA),
        ),
      ),
    );
  }
}
