import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'shader_mask_linear.dart';

class ButtonCircleIcon extends StatelessWidget {
  final IconData? iconData;
  final String labelText;
  const ButtonCircleIcon({
    this.iconData,
    required this.labelText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: Container(
          padding: const EdgeInsets.only(right: 8.0),
          decoration: const BoxDecoration(
            border: Border(
              right: BorderSide(
                color: Color(0xFFFE7348),
              ),
            ),
          ),
          child: SizedBox(
            width: 20,
            height: 20,
            child: ShaderMaskLinear(
              child: FaIcon(
                iconData,
                size: 20.0,
              ),
            ),
          ),
        ),
        label: ShaderMaskLinear(
          child: Text(
            labelText,
            style: const TextStyle(fontWeight: FontWeight.w400),
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          onPrimary: const Color(0xFFF6366B),
          padding: const EdgeInsets.all(24),
          shape: const StadiumBorder(),
          alignment: Alignment.centerLeft,
        ),
        onPressed: () {},
      ),
    );
  }
}
