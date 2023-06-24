import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../models/transaction_model.dart';
import '../actions.dart';
import '../store.dart';
import 'authorization_actions.dart';

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

String updateEmail(String email) {
  RegExp emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.)+[a-zA-Z]{2,}$');

  return emailRegex.hasMatch(email) ? email : '';
}

Future<void> submitEmail(Function onComplete) async {
  store.dispatch(SetLoadingAction(true));
  store.state.authorizationModel.userExists = await doesUserExist();
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

Future<bool> doesUserExist() async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final signInMethods = await auth
      .fetchSignInMethodsForEmail(store.state.authorizationModel.email);
  return signInMethods.isNotEmpty;
}

Future<String> registerUser() async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: store.state.authorizationModel.email,
      password: store.state.authorizationModel.password,
    );
    store.state.user = userCredential.user!;

    final CollectionReference<Map<String, dynamic>> users =
        FirebaseFirestore.instance.collection(store.state.user!.uid);
    for (final transaction in store.state.transactions) {
      await users.add(transaction.toMap());
    }

    return '';
  } on Exception catch (e) {
    return e.toString();
  }
}

Future<String> signInUser() async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: store.state.authorizationModel.email,
      password: store.state.authorizationModel.password,
    );
    store.state.user = userCredential.user!;
    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection(store.state.user!.uid);

    QuerySnapshot querySnapshot = await collectionRef.get();
    List<QueryDocumentSnapshot> documents = querySnapshot.docs;
    final List<TransactionModel> list = [];
    for (QueryDocumentSnapshot document in documents) {
      list.add(
        TransactionModel.fromMap(
          document.data() as Map<String, dynamic>,
        ),
      );
    }
    store.state.transactions = list;

    return '';
  } catch (e) {
    return e.toString();
  }
}
