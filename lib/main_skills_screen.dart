import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sports_tech_app/dummy_data.dart';
import 'package:sports_tech_app/skill_card.dart';
import 'package:sports_tech_app/model.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<dynamic> decoded = jsonDecode(sampleJson);
    final List<Skill> skills = decoded.map((e) => Skill.fromJson(e)).toList();

    // Group by level
    final List<String> levels = ["Basic", "Intermediate", "Advanced"];
    final Map<String, List<Skill>> grouped = {
      for (var level in levels)
        level: skills.where((s) => s.level == level).toList()
    };

    return Scaffold(
      appBar: AppBar(
  title: const Text(
    "Sports Skills",
    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  ),
  centerTitle: true,
  elevation: 0,
  flexibleSpace: Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [Color.fromARGB(255, 17, 181, 203), Color(0xFF2575FC)], // Purple → Blue
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
  ),
),
      body: Container(
        decoration: BoxDecoration(
    gradient: const LinearGradient(
      colors: [Color(0xFFFDFBFB), Color(0xFFECEFF1)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    image: DecorationImage(
      image: NetworkImage("https://assets.superblog.ai/site_cuid_clr6oh1no0006rmr89yhkxgu8/images/image-41-3-1712752581555-compressed.png"),
      fit: BoxFit.cover,
      colorFilter: ColorFilter.mode(
        Colors.white.withOpacity(0.1), // very light overlay
        BlendMode.dstATop,
      ),
    ),
  ),
        child: ListView(
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
      ),
    );
  }
}
