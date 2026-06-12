import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class NutritionScreen extends StatelessWidget {
  const NutritionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(child: SingleChildScrollView(padding: const EdgeInsets.all(20), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Text('Nutrition', style: TextStyle(color: AppTheme.textPrimary, fontSize: 26, fontWeight: FontWeight.w800)),
          Container(width: 42, height: 42, decoration: BoxDecoration(color: AppTheme.surfaceLight, borderRadius: BorderRadius.circular(12)),
            child: const Icon(Icons.calendar_today, color: AppTheme.textPrimary, size: 18)),
        ]),
        const SizedBox(height: 8),
        const Text('Today, 20 May', style: TextStyle(color: AppTheme.primary, fontSize: 14, fontWeight: FontWeight.w600)),
        const SizedBox(height: 24),
        Center(child: Stack(alignment: Alignment.center, children: [
          SizedBox(width: 160, height: 160, child: CircularProgressIndicator(value: 1650/2200, strokeWidth: 12, backgroundColor: AppTheme.surfaceLighter, valueColor: const AlwaysStoppedAnimation(AppTheme.primary))),
          Column(children: [
            const Text('1,650', style: TextStyle(color: AppTheme.textPrimary, fontSize: 32, fontWeight: FontWeight.w800)),
            const Text('/ 2,200 kcal', style: TextStyle(color: AppTheme.textSecondary, fontSize: 13)),
            const SizedBox(height: 4),
            Text('735 kcal left', style: TextStyle(color: AppTheme.primary, fontSize: 12, fontWeight: FontWeight.w600)),
          ]),
        ])),
        const SizedBox(height: 24),
        Row(children: [
          _macro('Proteins', '120/150g', Icons.egg, const Color(0xFF69F0AE)),
          const SizedBox(width: 12),
          _macro('Carbs', '180/250g', Icons.grain, AppTheme.warning),
          const SizedBox(width: 12),
          _macro('Fats', '55/70g', Icons.local_fire_department, AppTheme.calories),
        ]),
        const SizedBox(height: 24),
        const Text('Meal Plan', style: TextStyle(color: AppTheme.textPrimary, fontSize: 18, fontWeight: FontWeight.w700)),
        const SizedBox(height: 14),
        _meal('Breakfast', 'Oatmeal with Fruits', 450, Icons.free_breakfast, const Color(0xFFFFD740)),
        _meal('Lunch', 'Grilled Chicken Salad', 550, Icons.lunch_dining, AppTheme.primary),
        _meal('Dinner', 'Salmon with Veggies', 650, Icons.dinner_dining, const Color(0xFFFF7043)),
      ]))),
    );
  }

  Widget _macro(String label, String value, IconData icon, Color color) => Expanded(child: Container(
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(color: AppTheme.surfaceLight, borderRadius: BorderRadius.circular(14), border: Border.all(color: color.withOpacity(0.2))),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Icon(icon, color: color, size: 20), const SizedBox(height: 8),
      Text(label, style: const TextStyle(color: AppTheme.textSecondary, fontSize: 11)),
      const SizedBox(height: 2),
      Text(value, style: const TextStyle(color: AppTheme.textPrimary, fontSize: 13, fontWeight: FontWeight.w700)),
    ]),
  ));

  Widget _meal(String meal, String food, int cal, IconData icon, Color color) => Container(
    margin: const EdgeInsets.only(bottom: 12), padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(color: AppTheme.surfaceLight, borderRadius: BorderRadius.circular(16)),
    child: Row(children: [
      Container(width: 50, height: 50, decoration: BoxDecoration(color: color.withOpacity(0.15), borderRadius: BorderRadius.circular(14)), child: Icon(icon, color: color, size: 24)),
      const SizedBox(width: 14),
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(meal, style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
        Text(food, style: const TextStyle(color: AppTheme.textPrimary, fontWeight: FontWeight.w700)),
      ])),
      Text('$cal kcal', style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
      const SizedBox(width: 8),
      const Icon(Icons.arrow_forward_ios, color: AppTheme.textMuted, size: 14),
    ]),
  );
}
