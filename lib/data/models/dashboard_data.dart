// domain/models/dashboard_data.dart

class DashboardData {
  final int totalOrders;
  final int totalProducts;
  final int totalCustomers;
  final List<Order> recentOrders;

  DashboardData({
    required this.totalOrders,
    required this.totalProducts,
    required this.totalCustomers,
    required this.recentOrders,
  });

  factory DashboardData.fromJson(Map<String, dynamic> json) {
    return DashboardData(
      totalOrders: json['totalOrders'],
      totalProducts: json['totalProducts'],
      totalCustomers: json['totalCustomers'],
      recentOrders: (json['recentOrders'] as List)
          .map((e) => Order.fromJson(e))
          .toList(),
    );
  }
}

class Order {
  final String id;
  final String customerName;
  final String date;
  final double total;

  Order({
    required this.id,
    required this.customerName,
    required this.date,
    required this.total,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      customerName: json['customerName'],
      date: json['date'],
      total: (json['total'] as num).toDouble(),
    );
  }
}
