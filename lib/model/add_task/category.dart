import 'package:flutter/material.dart';

class Category {
  final String title;
  final String subtitle;
  final String icon;
  final Color cardBackgroundColor;
  final Color iconBackgroundColor;

  Category({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.cardBackgroundColor,
    required this.iconBackgroundColor,
  });
}
