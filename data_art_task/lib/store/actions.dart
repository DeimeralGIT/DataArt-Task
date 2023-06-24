abstract class AppAction {
  const AppAction();
}

abstract class AuthorizationAction extends AppAction {
  const AuthorizationAction();
}

abstract class TransactionAction extends AppAction {
  const TransactionAction();
}

class SetLoadingAction extends AppAction {
  final bool isLoading;

  SetLoadingAction(this.isLoading);
}

class AnimateToPageAction extends AppAction {
  final Function() animate;

  AnimateToPageAction(this.animate);
}
