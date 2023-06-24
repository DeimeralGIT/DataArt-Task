//creates 50 random transactions
import 'dart:math';

import '../constants/transaction_type.dart';
import '../models/transaction_model.dart';

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
        value: (random.nextInt(9969) + 30) * random.nextDouble(),
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
