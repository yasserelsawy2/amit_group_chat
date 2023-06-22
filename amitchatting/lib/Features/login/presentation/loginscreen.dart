import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:groupchatapp/core/Stringsfile.dart';
import 'package:groupchatapp/core/constants.dart';
import 'package:groupchatapp/core/widgets/custom_button.dart';
import 'package:groupchatapp/core/widgets/custom_text_field.dart';
import 'package:groupchatapp/core/widgets/show_snack_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<void> loginUser() async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    setState(() {
      Strings.devicetoken = fcmToken!;
    });

    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!)
        .then((value) {
      FirebaseFirestore.instance.collection('users').doc().update(
          {'email': email, 'password': password, 'token': Strings.devicetoken});
      setState(() {
        Strings.userId = value.user!.uid;
        Strings.email = email!;
      });
    });
  }

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  String? email, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              const SizedBox(
                height: 75,
              ),
              Image.asset(
                'assets/images/Amit.png',
                scale: .5,
              ),
              const SizedBox(
                height: 75,
              ),
              const Row(
                children: [
                  Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CustomFormTextField(
                onChanged: (data) {
                  email = data;
                },
                hintText: 'Email',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomFormTextField(
                obscureText: true,
                onChanged: (data) {
                  password = data;
                },
                hintText: 'Password',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButon(
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    isLoading = true;
                    setState(() {});
                    try {
                      await loginUser();
                      setState(() {
                        Strings.email = email!;
                      });
                      // ignore: use_build_context_synchronously
                      Navigator.pushNamed(context, Strings.chatPageId,
                          arguments: email);
                    } on FirebaseAuthException catch (ex) {
                      if (ex.code == 'user-not-found') {
                        showSnackBar(context, 'user not found');
                      } else if (ex.code == 'wrong-password') {
                        showSnackBar(context, 'wrong password');
                      }
                    } catch (ex) {
                      print(ex);
                      showSnackBar(context, 'there was an error');
                    }

                    isLoading = false;
                    setState(() {});
                  } else {}
                },
                text: 'LOGIN',
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'dont\'t have an account?',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Strings.registerPageId);
                    },
                    child: const Text(
                      '  Register',
                      style: TextStyle(
                        color: Color(0xffC7EDE6),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
