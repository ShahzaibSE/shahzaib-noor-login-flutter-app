import 'package:flutter/material.dart';
import 'homepage.widget.dart';
import 'user-register.widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({ Key? key }) : super(key: key);
  static String tag = 'login-page';

  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailcontroller = TextEditingController();
    final TextEditingController passwordcontroller = TextEditingController();
    //
    final logo = Hero(
      tag: 'hero', 
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logo.png')
      )
    );
    //
    final email = TextFormField(
      controller: emailcontroller,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0)
        )
      ),
    );
    //
    final password = TextFormField(
      controller: passwordcontroller,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0)
        )
      ),
    );
    // Signing in firebase account //
    login() async{
      final String email = emailcontroller.text;
      final String password = passwordcontroller.text;
      FirebaseAuth auth = FirebaseAuth.instance;
      try {
        UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email,
          password: password
        );
        print('Signed in successfully');
        print(userCredential.user);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
      emailcontroller.clear();
      passwordcontroller.clear();
      Navigator.of(context).pushNamed(HomePage.tag); 
    }
    //
    final loginBtn = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: login,
          color: Colors.lightBlueAccent,
          child: Text('Log In', style: TextStyle(color: Colors.white)),
        ),
      )
    );
    //
    final forgetLabel = TextButton(
      child: Text('Don\'t have an account?', style: TextStyle(
          color: Colors.black54
        )
      ),
      onPressed: (){ Navigator.of(context).pushNamed(UserRegister.tag); }
    );
    //
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              logo,
              const SizedBox(height:48.0),
              email,
              const SizedBox(height: 8.0),
              password,
              const SizedBox(height: 24.0),
              loginBtn,
              forgetLabel
            ],
          )
        )
    );
  }
}