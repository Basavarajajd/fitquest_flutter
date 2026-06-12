import 'package:flutter/material.dart';
import '../../../core/services/step_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final StepService _stepService = StepService();
  int steps = 0;

  @override
  void initState() {
    super.initState();

    _stepService.startListening();

    _stepService.stepStream.listen((value) {
      setState(() {
        steps = value;
      });
    });
  }

  @override
  void dispose() {
    _stepService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double progress = steps / 10000;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Live Steps",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            Text(
              "$steps",
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text("Goal: 10,000 steps"),

            const SizedBox(height: 20),

            SizedBox(
              height: 160,
              width: 160,
              child: CircularProgressIndicator(
                value: progress > 1 ? 1 : progress,
                strokeWidth: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
