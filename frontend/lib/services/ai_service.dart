import 'dart:convert';
import 'package:http/http.dart' as http;


class AIService {

  static const String baseUrl =
      "https://subclarity-ai-api.onrender.com";


  static Future<String> getExplanation(
      String action
      ) async {

    try {

      final response = await http.post(
        Uri.parse("$baseUrl/ai/explain"),

        headers: {
          "Content-Type": "application/json",
        },

        body: jsonEncode({
          "action": action,
        }),
      );


      if (response.statusCode == 200) {

        final data = jsonDecode(response.body);

        return data["response"] ?? 
            "No AI response received.";

      }


      throw Exception(
        "AI request failed: ${response.statusCode}"
      );


    } catch (e) {

      throw Exception(
        "Unable to connect with AI service: $e"
      );

    }
  }
}