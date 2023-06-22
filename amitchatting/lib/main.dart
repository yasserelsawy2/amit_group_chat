import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:groupchatapp/myapp.dart';
import 'package:overlay_support/overlay_support.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onMessage.listen((event) {
    showSimpleNotification(Text(event.notification!.title!),
        subtitle: Text(event.notification!.body!), background: Colors.green);
  });
  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    showSimpleNotification(Text(event.notification!.title!),
        subtitle: Text(event.notification!.body!), background: Colors.green);
  });
  runApp(const MyApp());
}
