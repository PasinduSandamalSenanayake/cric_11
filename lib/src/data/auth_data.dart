
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationDataSource{
  Future<void> signUp (String email, String password,String passwordConfirm);
  Future<void> signIn(String email, String password);
}

class AuthenticationRemote extends AuthenticationDataSource{
  @override
  Future<void> signIn(String email, String password) async {
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email.trim(), password: password.trim());
  }

  @override
  Future<void> signUp(String email, String password, String passwordConfirm) async {
    if (password == passwordConfirm) {
      FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());
    }
  }
}