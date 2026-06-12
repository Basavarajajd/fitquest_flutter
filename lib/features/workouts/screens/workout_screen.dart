import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key});
  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  int _sel = 0;
  final _cats = ['For You', 'Strength', 'HIIT', 'Yoga', 'Cardio'];
  final _workouts = [
    {'title': 'Full Body Strength', 'level': 'Beginner', 'duration': '30 min', 'calories': 250, 'color': Color(0xFF1B5E20)},
    {'title': 'HIIT Cardio Blast', 'level': 'Intermediate', 'duration': '20 min', 'calories': 320, 'color': Color(0xFF0D47A1)},
    {'title': 'Lower Body Power', 'level': 'Intermediate', 'duration': '40 min', 'calories': 300, 'color': Color(0xFF4A148C)},
    {'title': 'Core Crusher', 'level': 'Beginner', 'duration': '15 min', 'calories': 150, 'color': Color(0xFF880E4F)},
    {'title': 'Upper Body Blast', 'level': 'Advanced', 'duration': '45 min', 'calories': 380, 'color': Color(0xFFBF360C)},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(padding: const EdgeInsets.fromLTRB(20,20,20,0), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Text('Workouts', style: TextStyle(color: AppTheme.textPrimary, fontSize: 26, fontWeight: FontWeight.w800)),
          Container(width: 42, height: 42, decoration: BoxDecoration(color: AppTheme.surfaceLight, borderRadius: BorderRadius.circular(12)),
            child: const Icon(Icons.tune, color: AppTheme.textPrimary, size: 20)),
        ])),
        const SizedBox(height: 16),
        SizedBox(height: 40, child: ListView.builder(
          scrollDirection: Axis.horizontal, padding: const EdgeInsets.symmetric(horizontal: 20),
          itemCount: _cats.length,
          itemBuilder: (_, i) => GestureDetector(
            onTap: () => setState(() => _sel = i),
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              decoration: BoxDecoration(color: i == _sel ? AppTheme.primary : AppTheme.surfaceLight, borderRadius: BorderRadius.circular(20)),
              child: Text(_cats[i], style: TextStyle(color: i == _sel ? Colors.black : AppTheme.textSecondary, fontWeight: i == _sel ? FontWeight.w700 : FontWeight.w500, fontSize: 13)),
            ),
          ),
        )),
        const SizedBox(height: 16),
        Expanded(child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemCount: _workouts.length,
          itemBuilder: (_, i) {
            final w = _workouts[i];
            return Container(
              margin: const EdgeInsets.only(bottom: 14), height: 110,
              decoration: BoxDecoration(color: AppTheme.surfaceLight, borderRadius: BorderRadius.circular(18), border: Border.all(color: AppTheme.surfaceLighter)),
              child: Row(children: [
                Container(width: 100,
                  decoration: BoxDecoration(color: (w['color'] as Color).withOpacity(0.6), borderRadius: const BorderRadius.only(topLeft: Radius.circular(18), bottomLeft: Radius.circular(18))),
                  child: const Icon(Icons.fitness_center, color: Colors.white54, size: 36)),
                Expanded(child: Padding(padding: const EdgeInsets.all(14), child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(w['title'] as String, style: const TextStyle(color: AppTheme.textPrimary, fontWeight: FontWeight.w700, fontSize: 15)),
                  const SizedBox(height: 4),
                  Text('${w['level']} • ${w['duration']}', style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
                  const SizedBox(height: 8),
                  Row(children: [const Icon(Icons.local_fire_department, color: AppTheme.calories, size: 14), const SizedBox(width: 4), Text('${w['calories']} kcal', style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12))]),
                ]))),
                Padding(padding: const EdgeInsets.only(right: 14), child: Container(width: 34, height: 34,
                  decoration: BoxDecoration(color: AppTheme.primary.withOpacity(0.15), shape: BoxShape.circle, border: Border.all(color: AppTheme.primary.withOpacity(0.5))),
                  child: const Icon(Icons.arrow_forward_ios, color: AppTheme.primary, size: 14))),
              ]),
            );
          },
        )),
      ])),
    );
  }
}
