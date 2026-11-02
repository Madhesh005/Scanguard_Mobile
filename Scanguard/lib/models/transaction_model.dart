class TransactionModel {
  final String id;
  final String date;
  final double totalAmount;
  final int itemCount;

  TransactionModel({
    required this.id,
    required this.date,
    required this.totalAmount,
    required this.itemCount,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'] ?? '',
      date: json['date'] ?? '',
      totalAmount: (json['totalAmount'] ?? 0.0).toDouble(),
      itemCount: json['itemCount'] ?? 0,
    );
  }
}
