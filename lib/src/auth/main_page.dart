import 'package:cric_11/src/auth/auth_page.dart';
import 'package:cric_11/src/screen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(stream: FirebaseAuth.instance.authStateChanges(),builder: (context,snapshot){
        // check if the user is logged in or not
        if(snapshot.hasData){
          return HomeScreen();
        }else{
          return AuthPage();
        }
      },),
    );
  }
}
