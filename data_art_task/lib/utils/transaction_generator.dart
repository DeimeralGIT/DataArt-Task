//creates 50 random transactions
import 'package:faker/faker.dart';

import '../constants/transaction_type.dart';
import '../models/transaction_model.dart';

List<TransactionModel> generateRandomTransactions() {
  final faker = Faker();
  //creates random ids insuring there are no duplicates
  final List<int> ids = [];

  while (ids.length < 50) {
    final id = faker.randomGenerator.integer(9999999, min: 1000000);
    if (!ids.contains(id)) {
      ids.add(id);
    }
  }

  final List<TransactionModel> list = [];

  for (int i = 0; i < 50; i++) {
    list.add(
      TransactionModel(
        type: TransactionType.values[faker.randomGenerator.integer(3)],
        id: ids[i],
        value: (faker.randomGenerator.integer(9999, min: 30)) *
            faker.randomGenerator.decimal(),
        date: faker.date.dateTime(),
        commission: faker.randomGenerator.decimal() * 3,
      ),
    );
  }

  return list;
}
