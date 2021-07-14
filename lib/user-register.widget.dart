import 'package:flutter/material.dart';

class UserRegister extends StatefulWidget {
  const UserRegister({ Key? key }) : super(key: key);
  static String tag = 'register-page';

  @override
  _UserRegisterState createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  @override
  Widget build(BuildContext context) {
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
      keyboardType: TextInputType.name,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'James',
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0)
        )
      ),
    );
    //
    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: 'abc@gmail.com',
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
    //
    final signUpBtn = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: (){
              Navigator.of(context).pop();
          },
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