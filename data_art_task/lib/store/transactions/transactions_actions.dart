import 'package:data_art_task/store/actions.dart';

class GetTransactionsAction extends TransactionAction {
  GetTransactionsAction();
}

class CancelTransactionAction extends TransactionAction {
  final int id;
  final Function onComplete;

  CancelTransactionAction(this.id, this.onComplete);
}
