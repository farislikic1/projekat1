import 'package:flutter/material.dart';
import 'package:prviprojekat/Screens/Home/home.dart';

class Authentification extends StatefulWidget {
  @override
  AuthentificationState createState() => AuthentificationState();
}

class AuthentificationState extends State<Authentification> {
  TextEditingController userControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: hexToColor('#5ba42f'),
      appBar: AppBar(
        leading: SizedBox(width: 5.0),
        backgroundColor: hexToColor('#3d422b'),
        elevation: 0.0,
        title: Text('Demo Tech Team 3', style: TextStyle(fontSize: 16.0)),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.0),
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Container(
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
                controller: userControler,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: 'Enter email',
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey, width: 2.0))),
              ),
              SizedBox(height: 40.0),
              TextField(
                controller: passwordControler,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.vpn_key),
                    labelText: 'Enter password',
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey, width: 2.0))),
                obscureText: true,
              ),
              SizedBox(height: 30.0),
              SizedBox(
                width: 160.0,
                child: RaisedButton(
                  color: hexToColor('#3d422b'),
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    if (validateUser(userControler.text) &&
                        validatePass(passwordControler.text)) {
                      secondscreenfunkcija(context);
                    }
                  },
                ),
              ),
              SizedBox(height: 10.0)
            ],
          ),
        ),
      )),
    );
  }

  void secondscreenfunkcija(BuildContext context) {
    String username = userControler.text;
    String password = passwordControler.text;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Home(user: username, pass: password),
        ));
  }
}

bool validateUser(String username) {
  if (username == '') {
    return false;
  }
  return true;
}

bool validatePass(String pass) {
  if (pass.length < 8) {
    return false;
  }
  return true;
}

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}
