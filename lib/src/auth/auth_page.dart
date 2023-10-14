import 'package:cric_11/src/screen/login/signin.dart';
import 'package:flutter/material.dart';

import '../screen/login/signup.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  bool auth = true;

  void to(){
    setState(() {
      auth =! auth;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(auth){
      return SignIn(to); // login page
    }else{
      return SignUp(to); // register page
    }
  }
}
