import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRegister extends StatefulWidget {
  const UserRegister({ Key? key }) : super(key: key);
  static String tag = 'register-page';

  @override
  _UserRegisterState createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  @override
  Widget build(BuildContext context) {
    // Controllers. 
    final TextEditingController fullnamecontroller = TextEditingController();
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
    final fullname = TextFormField(
      controller: fullnamecontroller,
      keyboardType: TextInputType.name,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Full Name',
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0)
        )
      ),
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
    // -- Registering on Firebase -- //
    register() async{
      final String fullname = fullnamecontroller.text;
      final String email = emailcontroller.text;
      final String password = passwordcontroller.text;
      //
      try {
        FirebaseAuth auth = FirebaseAuth.instance;
        // await auth.createUserWithEmailAndPassword(email: email, password: password);
        UserCredential userCrediential = await auth.createUserWithEmailAndPassword(
          email: email,
          password: password
        );
        print('User created on firebase');
        print(userCrediential.user);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print('User could not be created');
        print(e);
      }
      fullnamecontroller.clear();
      emailcontroller.clear();
      passwordcontroller.clear();
      Navigator.of(context).pop();
    }

    final signUpBtn = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: register,
          color: Colors.lightBlueAccent,
          child: Text('Sign Up', style: TextStyle(color: Colors.white)),
        ),
      )
    );

    //
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        actions: [
            IconButton(onPressed: (){ 
              Navigator.of(context).pop();
            }, 
              icon: Icon(Icons.cancel)
            )
          ],
      ),
      backgroundColor: Colors.white,
      body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              logo,
              const SizedBox(height:28.0),
              fullname,
              const SizedBox(height: 8.0),
              email,
              const SizedBox(height: 8.0),
              password,
              const SizedBox(height: 24.0),
              signUpBtn,
            ],
          )
        )
    );
  }
}