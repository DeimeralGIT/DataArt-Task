import 'dart:math';

import '../enums/transaction_type.dart';

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

//creates 50 random transactions
List<TransactionModel> generateRandomTransactions() {
  //creates random ids insuring there are no duplicates
  final List<int> ids = [];

  final random = Random();
  while (ids.length < 50) {
    final id = random.nextInt(8999999) + 1000000;
    if (!ids.contains(id)) {
      ids.add(id);
    }
  }

  final List<TransactionModel> list = [];

  for (int i = 0; i < 50; i++) {
    list.add(
      TransactionModel(
        type: TransactionType.values[random.nextInt(3)],
        id: ids[i],
        value: random.nextInt(9969) + 30,
        date: DateTime.now()
          ..add(
            Duration(
              days: random.nextInt(1000),
              hours: random.nextInt(23),
              minutes: random.nextInt(59),
            ),
          ),
        commission: random.nextDouble() * 3,
      ),
    );
  }

  return list;
}
