import 'dart:async';
import 'package:pedometer/pedometer.dart';

class StepService {
  StreamSubscription<StepCount>? _subscription;

  final _stepController = StreamController<int>.broadcast();
  Stream<int> get stepStream => _stepController.stream;

  int _initialSteps = -1;

  void startListening() {
    _subscription = Pedometer.stepCountStream.listen(
      (StepCount event) {
        if (_initialSteps == -1) {
          _initialSteps = event.steps;
        }

        final currentSteps = event.steps - _initialSteps;
        _stepController.sink.add(currentSteps < 0 ? 0 : currentSteps);
      },
    );
  }

  void stopListening() {
    _subscription?.cancel();
  }

  void dispose() {
    _subscription?.cancel();
    _stepController.close();
  }
}
