// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBUbVdSpp98cFbKjzw4yuIkLS3xQdXSgnA',
    appId: '1:125192465149:web:e45c6076c20ead21c4ac94',
    messagingSenderId: '125192465149',
    projectId: 'test-project-be482',
    authDomain: 'test-project-be482.firebaseapp.com',
    databaseURL: 'https://test-project-be482-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'test-project-be482.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCqyINCHLpj6c78UvhL-qdEAfccdXJzlKk',
    appId: '1:125192465149:android:838a0552bbd1ec5dc4ac94',
    messagingSenderId: '125192465149',
    projectId: 'test-project-be482',
    databaseURL: 'https://test-project-be482-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'test-project-be482.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA712bGDkTUdyA38sjdJFAOeiHXL2OCUeU',
    appId: '1:125192465149:ios:8bce9151b3f57a02c4ac94',
    messagingSenderId: '125192465149',
    projectId: 'test-project-be482',
    databaseURL: 'https://test-project-be482-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'test-project-be482.appspot.com',
    iosClientId: '125192465149-1rrphi9hi5un9rovjd99tk58rvtpfr3b.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebasetest',
  );
}