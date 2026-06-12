import 'dart:async';

class StepService {
  StreamSubscription? _subscription;

  void start() {}
  void stop() {
    _subscription?.cancel();
  }
}
