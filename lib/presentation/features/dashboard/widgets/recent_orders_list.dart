import 'package:flutter/material.dart';
import 'package:frontend/data/models/dashboard_data.dart';

class RecentOrdersList extends StatelessWidget {
  final List<Order> orders;

  const RecentOrdersList({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recent Orders',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            ...orders.map(
              (order) => ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(order.customerName),
                subtitle: Text(order.date),
                trailing: Text('Rp ${order.total.toStringAsFixed(0)}'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
