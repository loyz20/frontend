import 'package:flutter/material.dart';
import 'package:frontend/core/global.dart';
import 'package:frontend/data/repositories/api_service.dart';
import 'package:frontend/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel with ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;
  User? currentUser;

  Future<bool> login(String email, String password) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final data = await ApiService.login(email, password);
      debugPrint('[LoginViewModel] Login berhasil, data: $data');

      currentUser = User.fromJson(data);

      // Simpan token global & lokal
        globalToken = currentUser!.token;
        globalEmail = currentUser!.email;
        

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', currentUser!.token);
        await prefs.setString('email', currentUser!.email);

      return true;
    } catch (e) {
      errorMessage = e.toString();
      debugPrint('[LoginViewModel] ERROR saat login: $errorMessage');
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
      debugPrint('[LoginViewModel] Login proses selesai');
    }
  }
}
