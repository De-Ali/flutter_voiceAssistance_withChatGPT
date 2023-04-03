import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

String apikey = "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";

class ChatGptApi {
  static String baseUrl = "https://api.openai.com/v1/completions";

  static Map<String, String> header = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $apikey',
  };

  static sendMessage(String message) async {
    var res = await http.post(
      Uri.parse(baseUrl),
      headers: header,
      body: jsonEncode({
        "model": "text-davinci-003",
        "prompt": message,
        "temperature": 0,
        "max-token": 100,
        "top_p": 1,
        "frequency_penalty": 0.0,
        "presence_penalty": 0.0,
        "stop": ["Human:", "AI:"]
      }),
    );
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body.toString());
      var msg = data['choice'][0]['text'];
      return msg;
    } else {
      if (kDebugMode) {
        print("failed to fetch data");
      }
    }
  }
}
