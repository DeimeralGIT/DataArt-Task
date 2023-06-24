import 'actions.dart';
import 'authorization/authorization_reducers.dart';
import 'store.dart';
import 'transactions/transaction_reducer.dart';

AppState reducer(AppState state, AppAction action) {
  switch (action) {
    case AuthorizationAction():
      return authorizationReducer(state, action);
    case TransactionAction():
      return transactionReducer(state, action);
    case SetLoadingAction():
      return state..isLoading = action.isLoading;
    case AnimateToPageAction():
      action.animate();
      return state;
    default:
      return state;
  }
}
