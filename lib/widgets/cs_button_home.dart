import 'package:flutter/material.dart';

class CsButtonHome extends StatelessWidget {
  const CsButtonHome({
    required this.title,
    this.icon,
    this.onTap,
    super.key,
  });

  final IconData? icon;
  final Function()? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Flexible(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.blue, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
