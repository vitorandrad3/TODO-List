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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCdRHr00L2Z_Wc8xAwX12z1EL_L3Cw4IaU',
    appId: '1:372460221077:android:b14be705842f591121219c',
    messagingSenderId: '372460221077',
    projectId: 'todo-list-96002',
    databaseURL: 'https://todo-list-96002-default-rtdb.firebaseio.com',
    storageBucket: 'todo-list-96002.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCElCIcyAd4UQxzaDlW6CrFmdvVaobEPtI',
    appId: '1:372460221077:ios:32001c166de5b54f21219c',
    messagingSenderId: '372460221077',
    projectId: 'todo-list-96002',
    databaseURL: 'https://todo-list-96002-default-rtdb.firebaseio.com',
    storageBucket: 'todo-list-96002.appspot.com',
    iosClientId: '372460221077-moip1pka1jldf3hqbgacfpoqlvn8q3ru.apps.googleusercontent.com',
    iosBundleId: 'com.example.todoListTest',
  );
}
