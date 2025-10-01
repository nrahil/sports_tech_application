import 'package:flutter/material.dart';
import 'package:sports_tech_app/main_skills_screen.dart';
void main() {
  runApp(const MyApp());
}

/// Root App
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sports Skills',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const SkillsScreen(),
    );
  }
}

/// Model for Skill


/// Main Skills Screen

/// Skill Card Widget
