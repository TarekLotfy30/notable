import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class BuildSlidableAction extends StatelessWidget {
  const BuildSlidableAction({
    super.key,
    required this.icon,
    required this.backgroundColor,
    required this.label,
    required this.onPressed,
  });

  final IconData icon;
  final Color backgroundColor;
  final String label;
  final void Function(BuildContext)? onPressed;

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      onPressed: onPressed,
      backgroundColor: backgroundColor,
      foregroundColor: Colors.white,
      icon: icon,
      label: label,
    );
  }
}
