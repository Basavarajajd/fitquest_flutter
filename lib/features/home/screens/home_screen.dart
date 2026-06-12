import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _header(), const SizedBox(height: 24),
            _dailyProgress(), const SizedBox(height: 24),
            _quickActions(), const SizedBox(height: 24),
            _todayWorkout(), const SizedBox(height: 24),
            _recentActivity(),
          ]),
        ),
      ),
    );
  }

  Widget _header() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('Hello, Alex 👋', style: TextStyle(color: AppTheme.textSecondary, fontSize: 14)),
        const SizedBox(height: 4),
        RichText(text: const TextSpan(style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800), children: [
          TextSpan(text: "Let's crush\nyour ", style: TextStyle(color: AppTheme.textPrimary)),
          TextSpan(text: 'goals', style: TextStyle(color: AppTheme.primary)),
          TextSpan(text: ' today!', style: TextStyle(color: AppTheme.textPrimary)),
        ])),
      ]),
      Stack(children: [
        Container(width: 46, height: 46, decoration: BoxDecoration(color: AppTheme.surfaceLight, borderRadius: BorderRadius.circular(14)),
          child: const Icon(Icons.notifications_outlined, color: AppTheme.textPrimary)),
        Positioned(right: 10, top: 10, child: Container(width: 8, height: 8, decoration: const BoxDecoration(color: AppTheme.primary, shape: BoxShape.circle))),
      ]),
    ],
  );

  Widget _dailyProgress() => Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(color: AppTheme.surfaceLight, borderRadius: BorderRadius.circular(20), border: Border.all(color: AppTheme.primary.withOpacity(0.2))),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('Daily Progress', style: TextStyle(color: AppTheme.textSecondary, fontSize: 13, fontWeight: FontWeight.w600)),
      const SizedBox(height: 16),
      Row(children: [
        SizedBox(width: 90, height: 90, child: Stack(alignment: Alignment.center, children: [
          SizedBox(width: 90, height: 90, child: CircularProgressIndicator(value: 0.72, strokeWidth: 8, backgroundColor: AppTheme.surfaceLighter, valueColor: const AlwaysStoppedAnimation(AppTheme.primary))),
          const Text('72%', style: TextStyle(color: AppTheme.textPrimary, fontSize: 18, fontWeight: FontWeight.w800)),
        ])),
        const SizedBox(width: 24),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _statRow(Icons.local_fire_department, AppTheme.calories, 'Calories', '1,320 / 1,800 kcal'),
          const SizedBox(height: 10),
          _statRow(Icons.fitness_center, AppTheme.primary, 'Workout', '45 / 60 min'),
          const SizedBox(height: 10),
          _statRow(Icons.directions_walk, const Color(0xFF40C4FF), 'Steps', '7,842 / 10,000'),
        ])),
      ]),
    ]),
  );

  Widget _statRow(IconData icon, Color color, String label, String value) => Row(children: [
    Icon(icon, color: color, size: 16), const SizedBox(width: 8),
    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(label, style: const TextStyle(color: AppTheme.textMuted, fontSize: 11)),
      Text(value, style: const TextStyle(color: AppTheme.textPrimary, fontSize: 13, fontWeight: FontWeight.w600)),
    ]),
  ]);

  Widget _quickActions() {
    final actions = [
      {'icon': Icons.fitness_center, 'label': 'Workouts', 'color': AppTheme.primary},
      {'icon': Icons.restaurant, 'label': 'Nutrition', 'color': const Color(0xFF69F0AE)},
      {'icon': Icons.directions_walk, 'label': 'Steps', 'color': const Color(0xFF40C4FF)},
      {'icon': Icons.water_drop, 'label': 'Water', 'color': const Color(0xFF40C4FF)},
    ];
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const Text('Quick Actions', style: TextStyle(color: AppTheme.textPrimary, fontSize: 18, fontWeight: FontWeight.w700)),
        Text('View All', style: TextStyle(color: AppTheme.primary, fontSize: 13)),
      ]),
      const SizedBox(height: 14),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: actions.map((a) => Column(children: [
        Container(width: 64, height: 64,
          decoration: BoxDecoration(color: (a['color'] as Color).withOpacity(0.12), borderRadius: BorderRadius.circular(18), border: Border.all(color: (a['color'] as Color).withOpacity(0.3))),
          child: Icon(a['icon'] as IconData, color: a['color'] as Color, size: 28)),
        const SizedBox(height: 8),
        Text(a['label'] as String, style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
      ])).toList()),
    ]);
  }

  Widget _todayWorkout() => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      const Text("Today's Workout", style: TextStyle(color: AppTheme.textPrimary, fontSize: 18, fontWeight: FontWeight.w700)),
      Text('See All', style: TextStyle(color: AppTheme.primary, fontSize: 13)),
    ]),
    const SizedBox(height: 14),
    Container(
      height: 120,
      decoration: BoxDecoration(
        color: AppTheme.surfaceLight, borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(colors: [AppTheme.primary.withOpacity(0.3), AppTheme.surfaceLight], begin: Alignment.centerLeft, end: Alignment.centerRight),
      ),
      padding: const EdgeInsets.all(20),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('Chest & Triceps', style: TextStyle(color: AppTheme.textPrimary, fontSize: 20, fontWeight: FontWeight.w800)),
          SizedBox(height: 6),
          Text('Intermediate • 45 min', style: TextStyle(color: AppTheme.textSecondary, fontSize: 13)),
        ]),
        Container(width: 52, height: 52, decoration: const BoxDecoration(color: AppTheme.primary, shape: BoxShape.circle),
          child: const Icon(Icons.play_arrow, color: Colors.black, size: 28)),
      ]),
    ),
  ]);

  Widget _recentActivity() => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    const Text('Recent Activity', style: TextStyle(color: AppTheme.textPrimary, fontSize: 18, fontWeight: FontWeight.w700)),
    const SizedBox(height: 14),
    Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppTheme.surfaceLight, borderRadius: BorderRadius.circular(16)),
      child: Row(children: [
        Container(width: 44, height: 44, decoration: BoxDecoration(color: AppTheme.primary.withOpacity(0.15), borderRadius: BorderRadius.circular(12)),
          child: const Icon(Icons.directions_walk, color: AppTheme.primary, size: 22)),
        const SizedBox(width: 14),
        const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('10,245 Steps', style: TextStyle(color: AppTheme.textPrimary, fontWeight: FontWeight.w700)),
          SizedBox(height: 2),
          Text('7.8 km • 412 kcal', style: TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
        ])),
        const Text('Today', style: TextStyle(color: AppTheme.textMuted, fontSize: 12)),
      ]),
    ),
  ]);
}
