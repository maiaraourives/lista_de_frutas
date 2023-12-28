import 'package:flutter/material.dart';

class CsIcon extends StatelessWidget {
  const CsIcon.icon({
    required this.icon,
    this.size = 24,
    this.color,
    super.key,
  }) : svgPath = null;

  const CsIcon.svg({
    required this.svgPath,
    this.size = 30,
    this.color,
    Key? key,
  })  : icon = null,
        super(key: key);

  final String? svgPath;
  final IconData? icon;
  final Color? color;
  final double size;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final Color color = this.color ?? theme.primaryColor;

    return Icon(
      icon,
      size: size,
      color: color,
    );
  }
}
