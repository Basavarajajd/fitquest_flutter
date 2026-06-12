import 'package:flutter/material.dart';
import '../router/app_router.dart';

class FitQuestApp extends StatelessWidget {
  const FitQuestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'FitQuest',

      onGenerateRoute: AppRouter.generateRoute,

      initialRoute: '/',
    );
  }
}
