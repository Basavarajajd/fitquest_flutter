import 'dart:async';

class StepService {
  final _stepController = StreamController<int>.broadcast();
  Stream<int> get stepStream => _stepController.stream;
  final int _steps = 0;

  void startListening() { _stepController.add(_steps); }
  void stop() {}
  void dispose() { _stepController.close(); }
}
