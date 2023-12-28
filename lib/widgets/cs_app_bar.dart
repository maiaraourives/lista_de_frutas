import 'package:flutter/material.dart';

class CsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CsAppBar({
    required this.title,
    this.preferredSize = const Size.fromHeight(65),
    this.elevation = 3,
    this.actions,
    this.leading,
    this.automaticallyImplyLeading = true,
    super.key,
  });

  @override
  final Size preferredSize;
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final double elevation;
  final bool? automaticallyImplyLeading;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      backgroundColor: theme.primaryColor,
      elevation: 0.0,
      toolbarHeight: 70,
      automaticallyImplyLeading: automaticallyImplyLeading!,
      title: FittedBox(
        child: Text(
          title,
          style: const TextStyle(fontSize: 20),
        ),
      ),
      centerTitle: true,
      actions: actions,
      leading: leading,
    );
  }
}
