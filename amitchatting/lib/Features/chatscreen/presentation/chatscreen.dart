// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:groupchatapp/core/Stringsfile.dart';
import 'package:groupchatapp/core/constants.dart';
import 'package:groupchatapp/Features/chatscreen/data/messagemodel.dart';
import 'package:groupchatapp/core/widgets/chat_buble.dart';
import 'package:groupchatapp/core/widgets/show_snack_bar.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ChatPage extends StatelessWidget {
  final _controller = ScrollController();

  final CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollections);
  TextEditingController controller = TextEditingController();

  ChatPage({super.key});
  @override
  Widget build(BuildContext context) {
    // var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> messagesList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
          }

          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: kPrimaryColor,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/Amit.png',
                  ),
                ],
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      reverse: true,
                      controller: _controller,
                      itemCount: messagesList.length,
                      itemBuilder: (context, index) {
                        return messagesList[index].id == Strings.email
                            ? ChatBuble(
                                message: messagesList[index],
                              )
                            : ChatBubleForFriend(message: messagesList[index]);
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    height: 70,
                    width: 300,
                    child: TextField(
                      minLines: 3,
                      maxLines: 3,
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: 'Send Message',
                        suffixIcon: IconButton(
                          onPressed: () async {
                            if (await InternetConnectionChecker()
                                .hasConnection) {
                              if (controller.text.isNotEmpty) {
                                messages.add(
                                  {
                                    kMessage: controller.text,
                                    kCreatedAt: DateTime.now(),
                                    'senderId': Strings.email
                                  },
                                );
                              }
                              controller.clear();
                            } else {
                              // ignore: use_build_context_synchronously
                              showSnackBar(context, 'Check your connection');
                            }
                          },
                          icon: const Icon(
                            Icons.send,
                            color: kPrimaryColor,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
