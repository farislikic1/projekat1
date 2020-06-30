import 'package:flutter/material.dart';
import 'package:prviprojekat/Screens/Auth/sign_in.dart';
import 'package:prviprojekat/Screens/Auth/authentification.dart';

class GoogleScreen extends StatelessWidget {
  // GoogleScreen(email, imageUrl, name,);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hexToColor('#4ee44e'),
      appBar: AppBar(
        backgroundColor: hexToColor('#3d422b'),
        elevation: 0.0,
        title: Text('Demo Tech Team 3', style: TextStyle(fontSize: 16.0)),
      ),
      body: Container(
        // decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //       begin: Alignment.topRight,
        //       end: Alignment.bottomLeft,
        //       colors: [Colors.green[100], Colors.green[600]],
        //     ),
        //     ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(
                  imageUrl,
                ),
                radius: 60,
                backgroundColor: Colors.transparent,
              ),
              SizedBox(height: 40),
              Text(
                'NAME',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              Text(
                name,
                style: TextStyle(
                    fontSize: 25,
                    //color: Colors.deepPurple,
                    color: hexToColor('#3d422b'),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'EMAIL',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              Text(
                email,
                style: TextStyle(
                    fontSize: 25,
                    //color: Colors.deepPurple,
                    color: hexToColor('#3d422b'),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
              RaisedButton(
                onPressed: () {
                  signOutGoogle();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) {
                    return Authentification();
                  }), ModalRoute.withName('/'));
                },
                //color: Colors.deepPurple,
                color: hexToColor('#3d422b'),
                child: Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Text(
                    'Sign Out',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
