import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final String baseUrl;
  final FlutterSecureStorage storage;

  AuthService({required this.baseUrl, FlutterSecureStorage? storage})
      : storage = storage ?? const FlutterSecureStorage();

  Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/auth/signin');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      return _processResponse(response);
    } catch (e) {
      // Handle network errors
      return {
        'success': false,
        'message': 'Network error: Unable to reach the server.',
      };
    }
  }

  Future<Map<String, dynamic>> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String gender,
    required bool isTermsAndConditionsAccepted,
  }) async {
    final url = Uri.parse('$baseUrl/auth/signup');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'password': password,
          'gender': gender,
          'isTermsAndConditionsAccepted': isTermsAndConditionsAccepted,
        }),
      );

      return _processResponse(response);
    } catch (e) {
      // Handle network errors
      return {
        'success': false,
        'message': 'Network error: Unable to reach the server.',
      };
    }
  }

  Future<void> saveToken(String token) async {
    await storage.write(key: 'jwt_token', value: token);
  }

  Future<String?> getToken() async {
    return await storage.read(key: 'jwt_token');
  }

  Future<void> deleteToken() async {
    await storage.delete(key: 'jwt_token');
  }

  Map<String, dynamic> _processResponse(http.Response response) {
    final statusCode = response.statusCode;
    final data = jsonDecode(response.body);

    if (statusCode >= 200 && statusCode < 300) {
      return {'success': true, 'data': data};
    } else {
      return {
        'success': false,
        'message': data['message'] ?? 'An error occurred',
        'statusCode': statusCode,
        'body': data,
      };
    }
  }
}