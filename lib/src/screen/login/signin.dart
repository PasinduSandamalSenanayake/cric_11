import 'package:cric_11/src/screen/login/signup.dart';
import 'package:flutter/material.dart';

import '../../const/color.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Image.asset(
          "images/logo/cric11_white.png",
          height: 25,
          width: 25,
        ),
        title: Text(
            "Sign In",
        ),
        backgroundColor: custom_blue,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              logo(),
              textfield_email(),
              textfield_password(),
              textfield_register(),
              signIn_button(),
            ],
          ),
        ),
      ),
    );
  }

  Widget logo(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 70),
      child: Container(
        height: 250,
        width: 250,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/logo/cric11.png"),
            fit: BoxFit.cover,
          ),
        )

      ),
    );
  }

  Widget textfield_email(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          ),
        child: TextField(
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.email,
              color: custom_blue,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            hintText: "Email",
            hintStyle: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: custom_blue,
                width: 2.0,
              ),
            ),
          ),
        ),
        ),
      );
  }

  Widget textfield_password(){
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock,
              color: custom_blue,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            hintText: "Password",
            hintStyle: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: custom_blue,
                width: 2.0,
              ),
            ),
         suffixIcon: GestureDetector(
           onTap: () {
            setState(() {
             _obscureText = !_obscureText;
            });
           },
           child: Icon(
             _obscureText ? Icons.visibility : Icons.visibility_off,
              color: Colors.blue, // Change to your desired icon color
             ),
          ),
        ),
          obscureText: _obscureText,
      ),
      ),
    );
  }

  Widget textfield_register() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Don't have an account? ",
              style : Theme.of(context).textTheme.subtitle1,
            ),
            TextButton(
              onPressed: (){
                Navigator.push(
                  context as BuildContext,
                  MaterialPageRoute(builder: (context) => SignUp())
                );
              },
              child: Text("Register",
                style: TextStyle(
                  color: custom_blue,
                  fontSize: 16,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget signIn_button(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Container(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: (){},
          child: Text("SIGN IN",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: custom_blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }

}
