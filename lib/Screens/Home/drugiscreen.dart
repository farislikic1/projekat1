/*import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Citanje extends StatefulWidget {
  @override
  _CitanjeState createState() => _CitanjeState();
}

class _CitanjeState extends State<Citanje> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Demo Tech Team 3'),
        ),
        body: StreamBuilder(
          stream: Firestore.instance.collection('users').snapshots(),
          builder: (context, snapshot) {
            return Column(
              children: <Widget>[
                Text(snapshot.data.documen[0]["Email"]),
                Text(snapshot.data.document[0]["Password"].toString())
              ],
            );
          },
        ));
  }
}
*/
