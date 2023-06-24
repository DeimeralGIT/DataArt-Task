class AuthorizationModel {
  String email;
  String password;
  bool isObscure;
  String confirmPassword;
  bool userExists;

  AuthorizationModel({
    this.email = '',
    this.password = '',
    this.isObscure = true,
    this.confirmPassword = '',
    this.userExists = false,
  });
}
