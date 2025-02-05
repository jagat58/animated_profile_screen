import 'package:animatedn_profile_screen/model.dart';
import 'package:flutter/material.dart';

List<CategoriesgridItemModel> categories = [
  CategoriesgridItemModel(Icons.star, "star",
      const Color.fromARGB(96, 189, 16, 16), 1, "/star"),
  CategoriesgridItemModel(
      Icons.calendar_today, "calender", Colors.teal, 2, "/calender"),
  CategoriesgridItemModel(
      Icons.location_on, 'location', Colors.blue, 3, '/location'),
  CategoriesgridItemModel(Icons.favorite, 'Favorite', Colors.teal, 4,
      '/favorite'), 
  CategoriesgridItemModel(Icons.settings, 'Setting', Colors.red, 5, '/setting'),
  CategoriesgridItemModel(
      Icons.subscriptions, 'Subscribe', Colors.lightBlue, 6, '/subscribe'),
  CategoriesgridItemModel(Icons.info, 'About', Colors.deepOrange, 7, '/about'),
  CategoriesgridItemModel(Icons.help, 'Help', Colors.deepOrange, 8, '/help'),
  CategoriesgridItemModel(
      Icons.question_answer, 'FAQ', Colors.deepPurple, 9, '/faq'),
];