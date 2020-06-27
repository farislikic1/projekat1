import 'package:flutter/material.dart';

class Authentification extends StatefulWidget {
  @override
  AuthentificationState createState() => AuthentificationState();
}

class AuthentificationState extends State<Authentification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.green[300],
      appBar: AppBar(
        leading: SizedBox(width: 5.0),
        backgroundColor: Colors.green[900],
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
      body:SingleChildScrollView(
        child:Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        
            child: Form(
              child: Column(
                children: <Widget>[
                SizedBox(height: 100.0),
                Text(
                  'REGISTER',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                  ),
              SizedBox(height: 60.0),
              TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: 'Enter email',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 2.0 
                        )
                    )
                  ),
                ),
                SizedBox(height: 10.0),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.vpn_key),
                    labelText: 'Enter password',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 2.0
                      )
                    )
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 30.0),
                RaisedButton(
                  color: Colors.brown[100],
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async{},
                ),
                SizedBox(height: 10.0)
                ],
        ),
        ),
      )
      ),
    );
  }
}