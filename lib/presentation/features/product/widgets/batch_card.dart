import 'package:flutter/material.dart';
import 'package:frontend/presentation/features/product/models/batch.dart';
import 'package:intl/intl.dart';

class BatchCard extends StatelessWidget {
  final Batch batch;

  const BatchCard({super.key, required this.batch});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final dateFormatted = DateFormat('dd MMM yyyy').format(batch.expiredAt);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: colorScheme.surfaceContainerHighest,
      child: ListTile(
        title: Text('Batch ID: ${batch.id}'),
        subtitle: Text('Expired: $dateFormatted'),
        trailing: Text(
          '${batch.quantity} pcs',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
