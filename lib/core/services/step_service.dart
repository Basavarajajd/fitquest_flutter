import 'dart:async';

class StepService {
  final _stepController = StreamController<int>.broadcast();
  Stream<int> get stepStream => _stepController.stream;

  void startListening() {}
  void stop() {}
  void dispose() {
    _stepController.close();
  }
}
