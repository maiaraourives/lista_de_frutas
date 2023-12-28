import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CsElevatedButton extends StatelessWidget {
  const CsElevatedButton({
    required this.onPressed,
    required this.label,
    this.width = double.infinity,
    this.backgroundColor,
    this.height = 45,
    this.icon,
    super.key,
  });

  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final String label;
  final Widget? icon;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: icon ?? Container(),
        clipBehavior: Clip.none,
        label: AutoSizeText(
          label.toUpperCase(),
          style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w800),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((_) {
            if (backgroundColor != null) {
              return backgroundColor;
            }

            return theme.primaryColor;
          }),
          overlayColor: MaterialStateProperty.resolveWith((_) {
            return theme.primaryColor.withOpacity(0.7);
          }),
          textStyle: MaterialStateProperty.resolveWith((_) {
            // ignore: deprecated_member_use
            return theme.textTheme.button;
          }),
          elevation: MaterialStateProperty.all(2),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
        ),
      ),
    );
  }
}
