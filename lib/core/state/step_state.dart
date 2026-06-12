import 'package:flutter/material.dart';
import '../services/step_service.dart';

class StepState extends ChangeNotifier {
  final StepService _service = StepService();

  int steps = 0;

  void start() {
    _service.startListening();

    _service.stepStream.listen((value) {
      steps = value;
      notifyListeners();
    });
  }

  void stop() {
    _service.stopListening();
  }
}
