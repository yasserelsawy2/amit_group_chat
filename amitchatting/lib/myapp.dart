import 'package:flutter/material.dart';
import 'package:groupchatapp/Features/Register/presentaion/registerscreen.dart';
import 'package:groupchatapp/Features/chatscreen/presentation/chatscreen.dart';
import 'package:groupchatapp/Features/login/presentation/loginscreen.dart';
import 'package:groupchatapp/core/Stringsfile.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Strings.loginPageId: (context) => LoginPage(),
        Strings.registerPageId: (context) => RegisterPage(),
        Strings.chatPageId: (context) => ChatPage()
      },
      initialRoute: Strings.loginPageId,
    );
  }
}
