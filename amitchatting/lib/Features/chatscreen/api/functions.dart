import 'dart:convert';

import 'package:groupchatapp/core/Stringsfile.dart';
import 'package:http/http.dart' as http;

class Functions {
  static Future<void> sendNotificationToTokens(List<String> tokens) async {
    const String apiUrl = 'https://fcm.googleapis.com/fcm/send';
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'key= AAAAskuSbhc:APA91bESNQxBrgCBvISev_2xRDNkpxE7hgmAftyuQs5hZIA0hnKLgLlGQHiG9ooTxvQtoCsR2la9BDWesq8W_2Fliads9jU6BMb7LlE4FagBvtj-9Ww_sSmasgpty8yorBk6YATL9cCE',
    };

    for (String token in tokens) {
      final Map<String, dynamic> body = {
        'to': token,
        'notification': {
          'body': Strings.message,
          'title': Strings.email,
        },
      };

      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        print('Notification sent to token $token');
      } else {
        print('Failed to send notification to token $token');
      }
    }
  }
}
