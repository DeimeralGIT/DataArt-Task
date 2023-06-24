import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_art_task/store/transactions/transactions_actions.dart';

import '../actions.dart';
import '../store.dart';

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
  final CollectionReference<Map<String, dynamic>> collection =
      FirebaseFirestore.instance.collection(store.state.user!.uid);
  QuerySnapshot querySnapshot =
      await collection.where('id', isEqualTo: id).get();
  // Assuming perfect conditions with no network errors.
  if (querySnapshot.size > 0) {
    // Get the first matching document
    DocumentSnapshot documentSnapshot = querySnapshot.docs[0];
    String documentId = documentSnapshot.id;
    store.state.transactions.removeWhere((transaction) => transaction.id == id);
    // Delete the document using its path ID
    await collection.doc(documentId).delete();
  }
  store.dispatch(SetLoadingAction(false));
  onComplete();
}
