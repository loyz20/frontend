// data/services/api_service.dart
import 'dart:convert';
import 'package:frontend/data/models/dashboard_data.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://localhost:8080/api/v1';

  static Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/login');
    final resp = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    final body = jsonDecode(resp.body) as Map<String, dynamic>;
    if (resp.statusCode == 200 && body['status'] == 'success') {
      // Ambil hanya objek data
      return body['data'] as Map<String, dynamic>;
    } else {
      throw Exception(body['message'] ?? 'Login gagal');
    }
  }

  static Future<DashboardData> fetchDashboard(String token) async {
    final url = Uri.parse('$baseUrl/auth/dashboard');
    final resp = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    final body = jsonDecode(resp.body);
    if (resp.statusCode == 200 && body['status'] == 'success') {
      return DashboardData.fromJson(body['data']);
    } else {
      throw Exception(body['message'] ?? 'Gagal memuat dashboard');
    }
  }
}
