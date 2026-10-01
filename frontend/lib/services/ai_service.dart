import 'dart:convert';
import 'package:http/http.dart' as http;


class AIService {

  static const String baseUrl =
      "http://YOUR_IP:8000";


  static Future<String> getExplanation(
      String action
      ) async {

    final response = await http.post(
      Uri.parse("$baseUrl/ai/explain"),
      headers: {
        "Content-Type": "application/json"
      },
      body: jsonEncode({
        "action": action
      }),
    );


    if(response.statusCode == 200){

      final data = jsonDecode(response.body);

      return data["response"];

    }

    throw Exception(
      "AI request failed"
    );
  }
}