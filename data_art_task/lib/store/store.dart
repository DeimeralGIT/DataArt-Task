import 'package:firebase_auth/firebase_auth.dart';
import 'package:redux/redux.dart';

import '../models/authorization_model.dart';
import '../models/transaction_model.dart';
import 'reducer.dart';

final store = Store(
  (state, action) => reducer(state, action),
  initialState: AppState.initialState(),
);

class AppState {
  //Authorization
  AuthorizationModel authorizationModel;
  User? user;

  //Transactions
  List<TransactionModel> transactions;

  //global
  bool isLoading;
  int pageViewIndex;

  AppState({
    required this.authorizationModel,
    required this.isLoading,
    required this.transactions,
    required this.pageViewIndex,
    this.user,
  });

  factory AppState.initialState() {
    return AppState(
      authorizationModel: AuthorizationModel(),
      isLoading: false,
      transactions: [],
      pageViewIndex: 0,
    );
  }
}
