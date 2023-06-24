import '../constants/transaction_type.dart';

// Freezed could be used but not efficient for just one model
class TransactionModel {
  final TransactionType type;
  final int id;
  final double value;
  final DateTime date;
  final double commission;

  TransactionModel({
    required this.type,
    required this.id,
    required this.value,
    required this.date,
    required this.commission,
  });

  Map<String, dynamic> toMap() {
    return {
      'type': type.name,
      'id': id,
      'value': value,
      'date': date.millisecondsSinceEpoch,
      'commission': commission,
    };
  }

  static TransactionModel fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      type: TransactionType.values.singleWhere(
        (type) => type.name == map['type'],
      ),
      id: map['id'],
      value: map['value'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      commission: map['commission'],
    );
  }

  double get total => commission + value;
}
