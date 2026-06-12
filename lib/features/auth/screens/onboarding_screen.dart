import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../../navigation/screens/main_navigation_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _ctrl = PageController();
  int _page = 0;

  final _pages = [
    {'icon': Icons.fitness_center, 'title': 'Your Quest\nTo Be Better', 'sub': 'Smart workouts, real progress\nand a stronger you.', 'color': AppTheme.primary},
    {'icon': Icons.track_changes, 'title': 'Track Every\nRepetition', 'sub': 'Log workouts, monitor calories\nand hit your daily goals.', 'color': Color(0xFF40C4FF)},
    {'icon': Icons.emoji_events, 'title': 'Earn Rewards\nStay Motivated', 'sub': 'Complete quests, unlock badges\nand level up your fitness.', 'color': AppTheme.warning},
  ];

  void _go() => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const MainNavigationScreen()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Stack(children: [
        PageView.builder(
          controller: _ctrl,
          onPageChanged: (i) => setState(() => _page = i),
          itemCount: _pages.length,
          itemBuilder: (_, i) {
            final p = _pages[i];
            return Padding(
              padding: const EdgeInsets.fromLTRB(24, 80, 24, 180),
              child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  width: 100, height: 100,
                  decoration: BoxDecoration(
                    color: (p['color'] as Color).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(28),
                    border: Border.all(color: (p['color'] as Color).withOpacity(0.4), width: 1.5),
                  ),
                  child: Icon(p['icon'] as IconData, color: p['color'] as Color, size: 52),
                ),
                const SizedBox(height: 40),
                Text(p['title'] as String, style: const TextStyle(color: AppTheme.textPrimary, fontSize: 40, fontWeight: FontWeight.w800, height: 1.1, letterSpacing: -1)),
                const SizedBox(height: 16),
                Text(p['sub'] as String, style: const TextStyle(color: AppTheme.textSecondary, fontSize: 16, height: 1.6)),
              ]),
            );
          },
        ),
        Positioned(bottom: 60, left: 24, right: 24, child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: List.generate(_pages.length, (i) => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: i == _page ? 24 : 8, height: 8,
            decoration: BoxDecoration(color: i == _page ? AppTheme.primary : AppTheme.surfaceLighter, borderRadius: BorderRadius.circular(4)),
          ))),
          const SizedBox(height: 32),
          SizedBox(width: double.infinity, height: 56,
            child: ElevatedButton(
              onPressed: _page == _pages.length - 1 ? _go : () => _ctrl.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut),
              style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primary, foregroundColor: Colors.black, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
              child: Text(_page == _pages.length - 1 ? 'Get Started' : 'Next', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
            ),
          ),
          const SizedBox(height: 16),
          TextButton(onPressed: _go, child: const Text('Already have an account? Login', style: TextStyle(color: AppTheme.textSecondary))),
        ])),
      ]),
    );
  }
}
