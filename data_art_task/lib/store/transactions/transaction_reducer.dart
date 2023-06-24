import '../../utils/firestore_utils.dart';
import '../actions.dart';
import '../store.dart';
import 'transactions_actions.dart';

AppState transactionReducer(AppState state, TransactionAction action) {
  switch (action) {
    case CancelTransactionAction():
      cancelTransaction(action.id, action.onComplete);
      return state;
    default:
      return state;
  }
}

Future<void> cancelTransaction(int id, Function onComplete) async {
  store.dispatch(SetLoadingAction(true));
  await FirestoreUtils().deleteDocument(id);
  store.dispatch(SetLoadingAction(false));
  onComplete();
}
