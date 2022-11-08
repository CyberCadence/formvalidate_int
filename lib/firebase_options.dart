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
    apiKey: 'AIzaSyB4JQQqomLkwB64Oi7z9rInyxe2DvvgOu8',
    appId: '1:281398791612:web:da7a81718c29698e22afb9',
    messagingSenderId: '281398791612',
    projectId: 'cruddd',
    authDomain: 'cruddd.firebaseapp.com',
    databaseURL: 'https://cruddd-default-rtdb.firebaseio.com',
    storageBucket: 'cruddd.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBHSm0v7yAriDUMuFtv9VrUzD8MA5eLuH8',
    appId: '1:281398791612:android:f7255f6d2a948c5322afb9',
    messagingSenderId: '281398791612',
    projectId: 'cruddd',
    databaseURL: 'https://cruddd-default-rtdb.firebaseio.com',
    storageBucket: 'cruddd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAYtSXQ4U9eZuQn11lK1F-7cGY1hFY0jjY',
    appId: '1:281398791612:ios:0822ef354ec5486722afb9',
    messagingSenderId: '281398791612',
    projectId: 'cruddd',
    databaseURL: 'https://cruddd-default-rtdb.firebaseio.com',
    storageBucket: 'cruddd.appspot.com',
    iosClientId: '281398791612-4jk8sk20t9nt8j7uha1dc3b7fm33n61d.apps.googleusercontent.com',
    iosBundleId: 'com.example.formCreate',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAYtSXQ4U9eZuQn11lK1F-7cGY1hFY0jjY',
    appId: '1:281398791612:ios:0822ef354ec5486722afb9',
    messagingSenderId: '281398791612',
    projectId: 'cruddd',
    databaseURL: 'https://cruddd-default-rtdb.firebaseio.com',
    storageBucket: 'cruddd.appspot.com',
    iosClientId: '281398791612-4jk8sk20t9nt8j7uha1dc3b7fm33n61d.apps.googleusercontent.com',
    iosBundleId: 'com.example.formCreate',
  );
}