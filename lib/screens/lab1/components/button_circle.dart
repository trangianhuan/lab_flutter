import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'shader_mask_linear.dart';

class ButtonCircle extends StatelessWidget {
  final IconData? iconData;
  final String? labelText;
  final double? width;
  final OutlinedBorder shape;
  const ButtonCircle({
    this.iconData,
    this.labelText,
    this.width,
    this.shape = const CircleBorder(),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: () {},
        child: iconData != null
            ? ShaderMaskLinear(
                child: FaIcon(
                  iconData,
                  size: 22,
                ),
              )
            : ShaderMaskLinear(
                child: Text(
                  labelText ?? '',
                  // style: const TextStyle(
                  //   color: Color(0xFFF6366B),
                  // ),
                ),
              ),
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          onPrimary: const Color(0xFFF6366B),
          splashFactory: InkRipple.splashFactory,
          padding: const EdgeInsets.all(22),
          // shape: const StadiumBorder(),
          shape: shape,
        ),
      ),
    );
  }
}
