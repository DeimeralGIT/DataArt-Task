import '../../constants/regexp.dart';
import '../../utils/firebase_utils.dart';
import '../../utils/firestore_utils.dart';
import '../actions.dart';
import '../store.dart';
import 'authorization_actions.dart';

final firebaseUtils = FirebaseUtils();
final firestoreUtils = FirestoreUtils();

AppState authorizationReducer(AppState state, AppAction action) {
  switch (action) {
    case UpdateEmailAction():
      return state..authorizationModel.email = updateEmail(action.email);
    case SubmitEmailAction():
      submitEmail(action.onComplete);
      return state;
    case UpdatePasswordAction():
      return state..authorizationModel.password = action.password;
    case UpdateConfirmPasswordAction():
      return state..authorizationModel.confirmPassword = action.password;
    case SubmitPasswordAction():
      submitPassword(action.onComplete);
      return state;
    case ObscurePasswordAction():
      return state
        ..authorizationModel.isObscure =
            !store.state.authorizationModel.isObscure;
    default:
      return state;
  }
}

String updateEmail(String email) => emailRegexp.hasMatch(email) ? email : '';

Future<void> submitEmail(Function onComplete) async {
  store.dispatch(SetLoadingAction(true));
  store.state.authorizationModel.userExists =
      await firebaseUtils.doesUserExist();
  store.dispatch(SetLoadingAction(false));
  onComplete.call();
}

Future<void> submitPassword(Function(String) onComplete) async {
  store.dispatch(SetLoadingAction(true));
  // As long as everything goes well the error will remain an empty String
  final error = store.state.authorizationModel.userExists
      ? await signInUser()
      : await registerUser();
  store.dispatch(SetLoadingAction(false));
  onComplete(error);
}

Future<String> registerUser() async {
  try {
    await firebaseUtils.createUser();
    await firestoreUtils.createCollection();

    return '';
  } on Exception catch (e) {
    return e.toString();
  }
}

Future<String> signInUser() async {
  try {
    await firebaseUtils.signInUser();
    await firestoreUtils.getCollection();

    return '';
  } catch (e) {
    return e.toString();
  }
}
