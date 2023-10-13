import 'package:cric_11/src/screen/login/signin.dart';
import 'package:flutter/material.dart';

import '../../const/color.dart';

class SignUp extends StatefulWidget {

  final VoidCallback show;
  const SignUp(this.show,{super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  FocusNode _focusNodeEmail = FocusNode();
  FocusNode _focusNodePassword = FocusNode();
  FocusNode _focusNodeConfirmPassword = FocusNode();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  @override
  void initState(){
    super.initState();
    _focusNodeEmail.addListener(() {
      setState(() {

      });
    });
    super.initState();
    _focusNodePassword.addListener(() {
      setState(() {

      });
    });
    super.initState();
    _focusNodeConfirmPassword.addListener(() {
      setState(() {

      });
    });
  }

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
          "Sign Up",
        ),
        backgroundColor: custom_blue,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              logo(),
              textfield_email(email, _focusNodeEmail, "Email", Icons.email),
              textfield_password(password, _focusNodePassword, "Password", Icons.lock),
              textfield_confirm_password(confirmPassword, _focusNodeConfirmPassword, "Confirm Password", Icons.lock),
              textfield_login(),
              signUp_button(),
            ],
          ),
        ),
      ),
    );
  }

  Widget logo(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 60),
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

  Widget textfield_email(TextEditingController _controller, FocusNode _focusNode, String _hintText, IconData _icon){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          controller: _controller,
          focusNode: _focusNode,
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
            hintText: _hintText,
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

  Widget textfield_password(TextEditingController _controller, FocusNode _focusNode, String _hintText, IconData _icon){
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          controller: _controller,
          focusNode: _focusNode,
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
            hintText: _hintText,
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

  Widget textfield_confirm_password(TextEditingController _controller, FocusNode _focusNode, String _hintText, IconData _icon){
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          controller: _controller,
          focusNode: _focusNode,
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
            hintText: _hintText,
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

  Widget textfield_login() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Do have an account? ",
              style : Theme.of(context).textTheme.subtitle1,
            ),
            GestureDetector(
              onTap: widget.show,
              child: Text(
                " Login",
                style: TextStyle(
                  color: custom_blue,
                  fontSize: 18,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget signUp_button(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Container(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: (){

          },
          child: Text("SIGN UP",
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
