import 'package:flutter/material.dart';
import '../../features/navigation/screens/main_navigation_screen.dart';

class FitQuestApp extends StatelessWidget {
  const FitQuestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'FitQuest',

      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
      ),

      home: const MainNavigationScreen(),
    );
  }
}
