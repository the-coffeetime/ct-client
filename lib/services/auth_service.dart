import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('loginToken');

    if (token == null) {
      return false;
    }

    return await validateToken(token);
  }

  Future<bool> validateToken(String token) async {
    final response = await http.post(
      Uri.parse('YOUR_API_ENDPOINT'), // Replace with your API endpoint
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'token': token}),
    );

    if (response.statusCode == 200) {
      // Assuming the API returns a boolean indicating if the token is valid
      final data = jsonDecode(response.body);
      return data['isValid']; // Adjust field based on your API response
    }

    return false;
  }
}