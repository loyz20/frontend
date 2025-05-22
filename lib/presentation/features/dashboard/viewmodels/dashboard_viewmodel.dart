// presentation/features/dashboard/viewmodels/dashboard_viewmodel.dart

import 'package:flutter/material.dart';
import 'package:frontend/core/global.dart';
import 'package:frontend/data/repositories/api_service.dart';
import 'package:frontend/data/models/dashboard_data.dart';

class DashboardViewModel with ChangeNotifier {
  DashboardViewModel();

  bool isLoading = false;
  String? errorMessage;
  DashboardData? summary;

  Future<void> loadDashboard() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      summary = await ApiService.fetchDashboard(globalToken!);
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
