import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../core/theme/app_theme.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});
  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  int _tab = 0;
  final _tabs = ['Overview', 'Weight', 'Steps', 'Workouts'];
  final _spots = [FlSpot(0,75), FlSpot(1,74.5), FlSpot(2,74.2), FlSpot(3,73.8), FlSpot(4,73.5), FlSpot(5,73), FlSpot(6,72.5)];
  final _bars = [6200.0, 8400, 7800, 9200, 10245, 8800, 9500];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(child: SingleChildScrollView(padding: const EdgeInsets.all(20), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('Progress', style: TextStyle(color: AppTheme.textPrimary, fontSize: 26, fontWeight: FontWeight.w800)),
        const SizedBox(height: 16),
        Row(children: List.generate(_tabs.length, (i) => GestureDetector(
          onTap: () => setState(() => _tab = i),
          child: Container(margin: const EdgeInsets.only(right: 20), padding: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: i == _tab ? AppTheme.primary : Colors.transparent, width: 2))),
            child: Text(_tabs[i], style: TextStyle(color: i == _tab ? AppTheme.textPrimary : AppTheme.textSecondary, fontWeight: i == _tab ? FontWeight.w700 : FontWeight.w500, fontSize: 14)),
          ),
        ))),
        const SizedBox(height: 24),
        Container(padding: const EdgeInsets.all(18), decoration: BoxDecoration(color: AppTheme.surfaceLight, borderRadius: BorderRadius.circular(18)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text('Weight', style: TextStyle(color: AppTheme.textPrimary, fontWeight: FontWeight.w700, fontSize: 16)),
            Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), decoration: BoxDecoration(color: AppTheme.surfaceLighter, borderRadius: BorderRadius.circular(8)),
              child: const Row(children: [Text('This Month', style: TextStyle(color: AppTheme.textSecondary, fontSize: 12)), SizedBox(width: 4), Icon(Icons.keyboard_arrow_down, color: AppTheme.textSecondary, size: 16)])),
          ]),
          const SizedBox(height: 12),
          Row(children: [
            const Text('72.5 kg', style: TextStyle(color: AppTheme.textPrimary, fontSize: 28, fontWeight: FontWeight.w800)),
            const SizedBox(width: 12),
            Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: AppTheme.primary.withOpacity(0.15), borderRadius: BorderRadius.circular(6)),
              child: Row(children: [const Icon(Icons.arrow_downward, color: AppTheme.primary, size: 12), const SizedBox(width: 2), Text('2.5 kg vs last month', style: TextStyle(color: AppTheme.primary, fontSize: 11))])),
          ]),
          const SizedBox(height: 16),
          SizedBox(height: 140, child: LineChart(LineChartData(
            gridData: FlGridData(show: true, drawVerticalLine: false, horizontalInterval: 1, getDrawingHorizontalLine: (v) => FlLine(color: AppTheme.surfaceLighter, strokeWidth: 1)),
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, interval: 1, reservedSize: 30, getTitlesWidget: (v, m) => Text(v.toInt().toString(), style: const TextStyle(color: AppTheme.textMuted, fontSize: 10)))),
              bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, getTitlesWidget: (v, m) {
                const l = ['20 Apr','27 Apr','4 May','11 May','18 May','',''];
                return v.toInt() < l.length ? Text(l[v.toInt()], style: const TextStyle(color: AppTheme.textMuted, fontSize: 9)) : const SizedBox();
              })),
              topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            borderData: FlBorderData(show: false), minY: 70, maxY: 76,
            lineBarsData: [LineChartBarData(spots: _spots, isCurved: true, color: AppTheme.primary, barWidth: 2.5,
              dotData: FlDotData(show: true, getDotPainter: (s,p,b,i) => FlDotCirclePainter(radius: 4, color: AppTheme.primary, strokeWidth: 2, strokeColor: AppTheme.background)),
              belowBarData: BarAreaData(show: true, color: AppTheme.primary.withOpacity(0.08)))],
          ))),
        ])),
        const SizedBox(height: 24),
        Row(children: [
          _stat('Workouts', '16', 'This Month', Icons.fitness_center, AppTheme.primary),
          const SizedBox(width: 14),
          _stat('Calories', '12,650', 'This Month', Icons.local_fire_department, AppTheme.calories),
        ]),
        const SizedBox(height: 24),
        Container(padding: const EdgeInsets.all(18), decoration: BoxDecoration(color: AppTheme.surfaceLight, borderRadius: BorderRadius.circular(18)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Steps', style: TextStyle(color: AppTheme.textPrimary, fontWeight: FontWeight.w700, fontSize: 16)),
          const Text('78,543', style: TextStyle(color: AppTheme.textPrimary, fontSize: 26, fontWeight: FontWeight.w800)),
          const Text('This Month', style: TextStyle(color: AppTheme.textMuted, fontSize: 11)),
          const SizedBox(height: 16),
          SizedBox(height: 100, child: BarChart(BarChartData(
            gridData: const FlGridData(show: false),
            titlesData: const FlTitlesData(show: false),
            borderData: FlBorderData(show: false),
            barGroups: _bars.asMap().entries.map((e) => BarChartGroupData(x: e.key, barRods: [BarChartRodData(toY: e.value/1000, color: AppTheme.primary, width: 22, borderRadius: BorderRadius.circular(6))])).toList(),
          ))),
        ])),
      ]))),
    );
  }

  Widget _stat(String label, String value, String sub, IconData icon, Color color) => Expanded(child: Container(
    padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: AppTheme.surfaceLight, borderRadius: BorderRadius.circular(16)),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(label, style: const TextStyle(color: AppTheme.textSecondary, fontSize: 13)), Icon(icon, color: color, size: 20)]),
      const SizedBox(height: 8),
      Text(value, style: const TextStyle(color: AppTheme.textPrimary, fontSize: 26, fontWeight: FontWeight.w800)),
      Text(sub, style: const TextStyle(color: AppTheme.textMuted, fontSize: 11)),
    ]),
  ));
}
