import '../actions.dart';

class UpdateEmailAction extends AuthorizationAction {
  final String email;

  UpdateEmailAction(this.email);
}

class SubmitEmailAction extends AuthorizationAction {
  final Function onComplete;

  SubmitEmailAction(this.onComplete);
}

class UpdatePasswordAction extends AuthorizationAction {
  final String password;

  UpdatePasswordAction(this.password);
}

class ObscurePasswordAction extends AuthorizationAction {
  ObscurePasswordAction();
}

class UpdateConfirmPasswordAction extends AuthorizationAction {
  final String password;

  UpdateConfirmPasswordAction(this.password);
}

class SubmitPasswordAction extends AuthorizationAction {
  final Function(String) onComplete;

  SubmitPasswordAction(this.onComplete);
}
