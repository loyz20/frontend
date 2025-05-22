import 'package:flutter/foundation.dart';
import 'package:frontend/presentation/features/product/models/batch.dart';

class ProductDetailViewModel extends ChangeNotifier {
  bool isLoading = true;
  List<Batch> batches = [];

  Future<void> fetchBatches(String productId) async {
    await Future.delayed(const Duration(seconds: 1)); // simulasi loading

    // Simulasi data dummy
    batches = [
      Batch(id: 'B001', expiredAt: DateTime(2025, 12, 1), quantity: 50),
      Batch(id: 'B002', expiredAt: DateTime(2026, 2, 15), quantity: 100),
    ];

    isLoading = false;
    notifyListeners();
  }
}
