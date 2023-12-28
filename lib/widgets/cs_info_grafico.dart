import 'package:flutter/material.dart';

class CsInfoGrafico extends StatelessWidget {
  const CsInfoGrafico({
    required this.title,
    required this.height,
    required this.width,
    required this.fontSize,
    required this.color,
    this.colorContainer,
    this.gradient,
    super.key,
  });

  final double height;
  final double width;
  final double fontSize;
  final Color color;
  final Color? colorContainer;
  final Gradient? gradient;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: gradient,
            color: colorContainer,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}
