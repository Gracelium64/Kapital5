import 'package:firebase_auth/firebase_auth.dart';

abstract class Authrepository {
  Future<void> signInWithEmailAndPassword(String email, String pw);
  Future<void> createUserWithEmailAndPassword(String email, String pw);
  Future<void> signOut();
  Stream<User?> authStateChanges();
  Future<void> signInWithGoogle();
}
