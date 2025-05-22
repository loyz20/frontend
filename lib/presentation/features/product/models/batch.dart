class Batch {
  final String id;
  final DateTime expiredAt;
  final int quantity;

  Batch({
    required this.id,
    required this.expiredAt,
    required this.quantity,
  });
}
