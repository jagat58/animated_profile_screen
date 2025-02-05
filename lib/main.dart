import 'package:animatedn_profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'animated profile screen',
     
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}
