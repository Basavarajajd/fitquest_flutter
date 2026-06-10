import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget statCard(
      String title,
      String value,
      IconData icon,
      Color color,
      ) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 10),
            Text(
              value,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(title),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FitQuest"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        children: [
          statCard(
            "Steps",
            "0",
            Icons.directions_walk,
            Colors.blue,
          ),
          statCard(
            "Water",
            "0 L",
            Icons.water_drop,
            Colors.cyan,
          ),
          statCard(
            "Calories",
            "0",
            Icons.local_fire_department,
            Colors.orange,
          ),
          statCard(
            "Weight",
            "0 kg",
            Icons.monitor_weight,
            Colors.green,
          ),
        ],
      ),
    );
  }
}
