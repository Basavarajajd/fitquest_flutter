import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _fade, _scale;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 1200));
    _fade = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeIn));
    _scale = Tween<double>(begin: 0.8, end: 1).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutBack));
    _ctrl.forward();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const OnboardingScreen()));
    });
  }

  @override
  void dispose() { _ctrl.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Center(
        child: FadeTransition(opacity: _fade, child: ScaleTransition(scale: _scale,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Container(
              width: 90, height: 90,
              decoration: BoxDecoration(
                color: AppTheme.primary.withOpacity(0.15),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: AppTheme.primary, width: 2),
              ),
              child: const Icon(Icons.fitness_center, color: AppTheme.primary, size: 44),
            ),
            const SizedBox(height: 20),
            const Text('FitQuest', style: TextStyle(color: AppTheme.textPrimary, fontSize: 36, fontWeight: FontWeight.w800, letterSpacing: -1)),
            const SizedBox(height: 8),
            const Text('Your Quest To Be Better', style: TextStyle(color: AppTheme.primary, fontSize: 14, fontWeight: FontWeight.w500)),
          ]),
        )),
      ),
    );
  }
}
