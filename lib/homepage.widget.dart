import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static String tag = 'home-page';

  @override
  Widget build(BuildContext context) {
    // 
    final alucard = Hero(
      tag: 'hero',
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/alucard.jpeg'),
          radius: 72.0
        )
      )
    );
    //
    final greetingLabel = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text('Welcome Shahzaib', style: TextStyle(
        fontSize: 28.0,
        color: Colors.white
      )),
    );
    // 
    final aboutUser = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text('This is your user portal. So feel free to roam around and have fun! Praesent eget mi sed libero eleifend tempor. Sed at fringilla ipsum. Duis malesuada feugiat urna vitae convallis. Aliquam eu libero arcu.', style: TextStyle(
        fontSize: 16.0,
        color: Colors.white
      )),
    );
    //
    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue,
            Colors.lightBlueAccent
          ]
        ),
      ),
      child: Column(
        children: <Widget>[
          alucard,
          greetingLabel,
          aboutUser
        ]
      ),
    ); 
    //
    return Scaffold(
      body: body
    );
  }
}