import 'package:firebase_auth/firebase_auth.dart';

import '../store/store.dart';

class FirebaseUtils {
  Future<void> createUser() async {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: store.state.authorizationModel.email,
      password: store.state.authorizationModel.password,
    );
    store.state.user = userCredential.user!;
  }

  Future<bool> doesUserExist() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final signInMethods = await auth
        .fetchSignInMethodsForEmail(store.state.authorizationModel.email);
    return signInMethods.isNotEmpty;
  }

  Future<void> signInUser() async {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: store.state.authorizationModel.email,
      password: store.state.authorizationModel.password,
    );
    store.state.user = userCredential.user!;
  }
}
