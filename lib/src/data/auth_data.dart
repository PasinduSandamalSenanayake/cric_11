
import 'package:firebase_auth/firebase_auth.dart';

// authenticationDataSource is an abstract class that is used to create a blueprint for the AuthenticationRemote class
// why do we need to create a blueprint? because we want to create a class that is used to connect to the database
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