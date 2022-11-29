import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sports_flutter_app/screens/Signinpage.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
        automaticallyImplyLeading: false,
      ),
      body: Center(child: Column(children: <Widget>[
        Container(
          margin: EdgeInsets.all(25),
          child:Text(
            'Logged in User Email: ${FirebaseAuth.instance.currentUser!.email}',
            style: TextStyle(fontSize: 24),
          ),
        ),
        Container(
          margin: EdgeInsets.all(25),
          child: ElevatedButton(
            child: Text('Logout', style: TextStyle(fontSize: 20.0),),
            onPressed: () {
              _signOut();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SignInScreen()));
            },
          ),
        ),
      ]
      ),
      ),
    );
  }
  final FirebaseAuth auth = FirebaseAuth.instance;

  var currentUser = FirebaseAuth.instance.currentUser;


  _signOut() async {
    await auth.signOut();
  }
}