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
        return macos;
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
    apiKey: 'AIzaSyC70t138lT3suSMeTaP0S9fpM8ga3P0_PY',
    appId: '1:215103583180:web:717ac2cc0d8574fb66e369',
    messagingSenderId: '215103583180',
    projectId: 'geo-agency-mobile',
    authDomain: 'geo-agency-mobile.firebaseapp.com',
    storageBucket: 'geo-agency-mobile.appspot.com',
    measurementId: 'G-327SQLR7WD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAiLqOEpYELU-GKKXwiU-m7tSC6FuSJvHM',
    appId: '1:215103583180:android:b999f6a07eb0575266e369',
    messagingSenderId: '215103583180',
    projectId: 'geo-agency-mobile',
    storageBucket: 'geo-agency-mobile.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCs-D9BzHcUhcMGa_Tsp-l5ptjKGe4MERE',
    appId: '1:215103583180:ios:04f51779eb27ba0a66e369',
    messagingSenderId: '215103583180',
    projectId: 'geo-agency-mobile',
    storageBucket: 'geo-agency-mobile.appspot.com',
    iosBundleId: 'com.example.geoAgencyMobile',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCs-D9BzHcUhcMGa_Tsp-l5ptjKGe4MERE',
    appId: '1:215103583180:ios:57c3d50cd142811466e369',
    messagingSenderId: '215103583180',
    projectId: 'geo-agency-mobile',
    storageBucket: 'geo-agency-mobile.appspot.com',
    iosBundleId: 'com.example.geoAgencyMobile.RunnerTests',
  );
}