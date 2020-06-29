import 'package:flutter/material.dart';
import 'package:prviprojekat/Screens/Auth/authentification.dart';

class Home extends StatelessWidget {
  final String user;
  final String pass;
  Home({Key key, @required this.user, @required this.pass}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hexToColor('#4ee44e'),
      appBar: AppBar(
        leading: new IconButton(
          icon: Icon(Icons.close),
          color: Colors.white,
          onPressed: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Authentification(),
                ))
          },
        ),
        backgroundColor: hexToColor('#3d422b'),
        elevation: 0.0,
        title: Text('Demo Tech Team 3', style: TextStyle(fontSize: 16.0)),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.0),
          ),
        ],
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              readOnly: true,
              minLines: 10,
              maxLines: 15,
              autocorrect: false,
              decoration: InputDecoration(
                hintText: '\n Hey ' +
                    user +
                    ', welcome to second screen. \n \n \n \n \n Your password is ' +
                    pass,
                filled: true,
                fillColor: hexToColor('#bdef9a'),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
