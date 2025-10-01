import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sports_tech_app/dummy_data.dart';
import 'package:sports_tech_app/skill_card.dart';
import 'package:sports_tech_app/model.dart';
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
class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  // Sample JSON data
  

  @override
  Widget build(BuildContext context) {
    final List<dynamic> decoded = jsonDecode(sampleJson);
    final List<Skill> skills = decoded.map((e) => Skill.fromJson(e)).toList();

    // Group by level
    final List<String> levels = ["Basic", "Intermediate", "Advanced"];
    final Map<String, List<Skill>> grouped = {
      for (var level in levels) level: skills.where((s) => s.level == level).toList()
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sports Skills"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: levels.map((level) {
          final items = grouped[level]!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                level,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 180,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    return SkillCard(skill: items[index]);
                  },
                ),
              ),
              const SizedBox(height: 20),
            ],
          );
        }).toList(),
      ),
    );
  }
}

/// Skill Card Widget
