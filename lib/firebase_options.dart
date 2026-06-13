import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform => android;

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB8AzTllBUsJfaXvKXGel9BaxLbwL4gGrM',
    appId: '1:491389758789:android:b93ab10af990fdf47da22c',
    messagingSenderId: '491389758789',
    projectId: 'fitquest-cf3a4',
    storageBucket: 'fitquest-cf3a4.firebasestorage.app',
  );
}
