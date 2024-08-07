// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBugdTvCGzWZKfkfBIhLqPmP7dG7XRVe-c',
    appId: '1:1030102288513:android:18f301efcb4aa55254e580',
    messagingSenderId: '1030102288513',
    projectId: 'bab-el-ezz-f8e7a',
    storageBucket: 'bab-el-ezz-f8e7a.appspot.com',
  );

  // For Firebase JS SDK v7.20.0 and later, measurementId is optional
  static const web = FirebaseOptions(
      apiKey: "AIzaSyCiiNY7ey9M6HEOA2ojUHfbJbAdWyTNB_w",
      authDomain: "bab-el-ezz-f8e7a.firebaseapp.com",
      projectId: "bab-el-ezz-f8e7a",
      storageBucket: "bab-el-ezz-f8e7a.appspot.com",
      messagingSenderId: "1030102288513",
      appId: "1:1030102288513:web:c3cf1ed9be04cdce54e580",
      measurementId: "G-CP8H3EE2ZE");
}
