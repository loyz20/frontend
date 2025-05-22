import 'package:flutter/material.dart';
import 'package:frontend/presentation/features/product/models/product_model.dart';

class ProductViewModel extends ChangeNotifier {
  final List<Product> _products = [
    Product(id: 'p1', name: 'Paracetamol', description: 'Obat pereda nyeri', price: 5000, stock: 100),
    Product(id: 'p2', name: 'Vitamin C', description: 'Suplement vitamin', price: 15000, stock: 50),
  ];

  List<Product> get products => List.unmodifiable(_products);

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }

  void updateProduct(Product updatedProduct) {
    final index = _products.indexWhere((p) => p.id == updatedProduct.id);
    if (index != -1) {
      _products[index] = updatedProduct;
      notifyListeners();
    }
  }

  void deleteProduct(String id) {
    _products.removeWhere((p) => p.id == id);
    notifyListeners();
  }

  Product? getProductById(String id) {
    try {
      return _products.firstWhere((p) => p.id == id);
    } catch (e) {
      return null;
    }
  }
}
