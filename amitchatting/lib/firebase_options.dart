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
    apiKey: 'AIzaSyCp1C4lB9y0HZarCs9NfTUEaflWwn3--0E',
    appId: '1:765772066327:android:fd5382ddba8921f1a9f652',
    messagingSenderId: '765772066327',
    projectId: 'chatapp-64335',
    storageBucket: 'chatapp-64335.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAUqxUDQvG4sO9Ux3VD4fb-kJmdKWW3tsA',
    appId: '1:765772066327:ios:1c0960c39d58d07aa9f652',
    messagingSenderId: '765772066327',
    projectId: 'chatapp-64335',
    storageBucket: 'chatapp-64335.appspot.com',
    androidClientId: '765772066327-096n11k6h67a6j5ti0hgeovoos7mhvc1.apps.googleusercontent.com',
    iosClientId: '765772066327-fbqilm3bl28s47o5eq7r95eat8jsit11.apps.googleusercontent.com',
    iosBundleId: 'com.example.groupchatapp',
  );
}