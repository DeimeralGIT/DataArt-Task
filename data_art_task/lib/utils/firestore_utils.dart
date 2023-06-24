import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_art_task/utils/transaction_generator.dart';

import '../models/transaction_model.dart';
import '../store/store.dart';

class FirestoreUtils {
  Future<void> deleteDocument(int id) async {
    final CollectionReference<Map<String, dynamic>> collection =
        FirebaseFirestore.instance.collection(store.state.user!.uid);
    QuerySnapshot querySnapshot =
        await collection.where('id', isEqualTo: id).get();
    // Assuming perfect conditions with no network errors.
    if (querySnapshot.size > 0) {
      // Get the first matching document
      DocumentSnapshot documentSnapshot = querySnapshot.docs[0];
      String documentId = documentSnapshot.id;
      store.state.transactions
          .removeWhere((transaction) => transaction.id == id);
      // Delete the document using its path ID
      await collection.doc(documentId).delete();
    }
  }

  Future<void> createCollection() async {
    // Will create a collection of 50 randomly generated transactions
    final transactions = generateRandomTransactions();
    final CollectionReference<Map<String, dynamic>> users =
        FirebaseFirestore.instance.collection(store.state.user!.uid);
    for (final transaction in transactions) {
      await users.add(transaction.toMap());
    }
  }

  Future<void> getCollection() async {
    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection(store.state.user!.uid);
    QuerySnapshot querySnapshot = await collectionRef.get();
    List<QueryDocumentSnapshot> documents = querySnapshot.docs;
    final List<TransactionModel> list = [];
    if (documents.isNotEmpty) {
      for (QueryDocumentSnapshot document in documents) {
        list.add(
          TransactionModel.fromMap(
            document.data() as Map<String, dynamic>,
          ),
        );
      }
      store.state.transactions = list;
    } else {
      // If all transactions are cancelled - they will be reset after next signIn.
      await createCollection();
    }
  }
}
