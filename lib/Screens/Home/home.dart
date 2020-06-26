import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.green[100],
      appBar: AppBar(
        leading: SizedBox(width: 5.0),
        backgroundColor: Colors.green[300],
        elevation: 0.0,
        title: Text( 'Demo Tech Team 3',
          style: TextStyle(fontSize: 16.0)
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.0),
          ),
        ],
    ),
    );
  }
}
