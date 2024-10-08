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
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyCLGusfl6Xu-eg9HjAXdnokvvf6tqec9V8',
    appId: '1:512324142879:web:6ef592ba00bd24ae2f522a',
    messagingSenderId: '512324142879',
    projectId: 'brees-18761',
    authDomain: 'brees-18761.firebaseapp.com',
    storageBucket: 'brees-18761.appspot.com',
    measurementId: 'G-YLSJPDC2L3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDQ0IubQPlVbiowJW7erTOcKS_eWUQnpsU',
    appId: '1:512324142879:android:34a22ba4a4754d862f522a',
    messagingSenderId: '512324142879',
    projectId: 'brees-18761',
    storageBucket: 'brees-18761.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC-jOEWmINQK4DKV57OX-tyKvGEkOG0XDM',
    appId: '1:512324142879:ios:5213eb80c06bf9ea2f522a',
    messagingSenderId: '512324142879',
    projectId: 'brees-18761',
    storageBucket: 'brees-18761.appspot.com',
    iosBundleId: 'com.nite.brees',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC-jOEWmINQK4DKV57OX-tyKvGEkOG0XDM',
    appId: '1:512324142879:ios:5213eb80c06bf9ea2f522a',
    messagingSenderId: '512324142879',
    projectId: 'brees-18761',
    storageBucket: 'brees-18761.appspot.com',
    iosBundleId: 'com.nite.brees',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCLGusfl6Xu-eg9HjAXdnokvvf6tqec9V8',
    appId: '1:512324142879:web:e3edbfea719d274f2f522a',
    messagingSenderId: '512324142879',
    projectId: 'brees-18761',
    authDomain: 'brees-18761.firebaseapp.com',
    storageBucket: 'brees-18761.appspot.com',
    measurementId: 'G-PE7Q0L20SX',
  );
}
