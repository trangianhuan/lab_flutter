import 'package:flutter/material.dart';

class ShaderMaskLinear extends StatelessWidget {
  final Widget child;
  const ShaderMaskLinear({
    Key? key,
    required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [
          Color(0xFFFE7348),
          Color(0xFFF6366B),
        ],
        begin: FractionalOffset(0.0, 0.0),
        end: FractionalOffset(0.0, 1.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp,
      ).createShader(bounds),
      child: child,
    );
  }
}
