import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:kapital_5/src/data/authrepository.dart';

class FirebaseAuthRepository implements Authrepository {
  @override
  Future<void> createUserWithEmailAndPassword(String email, String pw) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: pw,
    );
  }

  @override
  Future<void> signInWithEmailAndPassword(String email, String pw) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: pw,
    );
  }

  @override
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Stream<User?> authStateChanges() {
    return FirebaseAuth.instance.authStateChanges();
  }

  @override
  Future<void> signInWithGoogle() async {
    await GoogleSignIn.instance.initialize();
    final GoogleSignInAccount googleUser =
        await GoogleSignIn.instance.authenticate();

    final GoogleSignInAuthentication googleAuth = googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
