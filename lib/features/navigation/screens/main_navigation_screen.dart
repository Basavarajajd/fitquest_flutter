import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../../home/screens/home_screen.dart';
import '../../workouts/screens/workout_screen.dart';
import '../../progress/screens/progress_screen.dart';
import '../../profile/screens/profile_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});
  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _i = 0;
  final _pages = const [HomeScreen(), WorkoutScreen(), ProgressScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: IndexedStack(index: _i, children: _pages),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: AppTheme.surface, border: Border(top: BorderSide(color: AppTheme.surfaceLighter, width: 1))),
        child: BottomNavigationBar(
          currentIndex: _i, onTap: (i) => setState(() => _i = i),
          backgroundColor: Colors.transparent, selectedItemColor: AppTheme.primary, unselectedItemColor: AppTheme.textMuted,
          type: BottomNavigationBarType.fixed, elevation: 0,
          selectedLabelStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
          unselectedLabelStyle: const TextStyle(fontSize: 11),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.fitness_center_outlined), activeIcon: Icon(Icons.fitness_center), label: 'Workouts'),
            BottomNavigationBarItem(icon: Icon(Icons.bar_chart_outlined), activeIcon: Icon(Icons.bar_chart), label: 'Progress'),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), activeIcon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
