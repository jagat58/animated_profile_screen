import 'package:flutter/material.dart';

class CategoriesgridItemModel {
  final IconData? icon;
  final String title;
  final Color color;
  final int id;
  final String route;

  CategoriesgridItemModel(
      IconData? icon, this.title, this.color, this.id, this.route)
      : icon = icon ?? Icons.help; // Provide a default icon if null
}