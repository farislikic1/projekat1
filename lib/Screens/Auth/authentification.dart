import 'package:flutter/material.dart';
import 'package:prviprojekat/Screens/Auth/sign_in.dart';
import 'package:prviprojekat/Screens/Home/googleScreen.dart';
import 'package:prviprojekat/Screens/Home/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Authentification extends StatefulWidget {
  @override
  AuthentificationState createState() => AuthentificationState();
}

class AuthentificationState extends State<Authentification> {
  final databaseReference = Firestore.instance;

  TextEditingController userControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();
  TextEditingController phoneControler = TextEditingController();
  bool _validateEmail = true;
  bool _validatePass = true;
  bool _validatePhone = true;
  bool _homeScreen = true;

  void createRecord() async {
    /* await databaseReference.collection("users").document("1").setData({
    'title': 'Mastering Flutter',
    'description': 'Programming Guide for Dart'
  });
*/
    DocumentReference ref = await databaseReference.collection("users").add({
      'Email': userControler.text,
      'Password': passwordControler.text,
      'Phone number': phoneControler.text
    });
    print(ref.documentID);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        // resizeToAvoidBottomPadding: false,
        backgroundColor: hexToColor('#4ee44e'),
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
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 30.0),
                    Text(
                      'REGISTER',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(height: 40.0),
                    // TextField(
                    //   controller: userControler,
                    //   decoration: InputDecoration(
                    //       prefixIcon: Icon(Icons.email),
                    //       labelText: 'Enter email',
                    //       errorText: _validateEmail
                    //           ? null
                    //           : 'Email field can\'t be empty',
                    //       border: OutlineInputBorder(
                    //           borderSide:
                    //               BorderSide(color: Colors.grey, width: 2.0))),
                    // ),
                    Theme(
                      child: TextFormField(
                        controller: userControler,
                        //autovalidate: false,
                        validator: (input) =>
                            input.isValidEmail() ? null : "Check your email",
                        autofocus: true,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            labelText: 'Enter email',
                            errorText:
                                _validateEmail ? null : 'Check your email',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey, width: 2.0))),
                      ),
                      data: Theme.of(context).copyWith(
                        primaryColor: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 30.0),
                    // TextField(
                    //   controller: passwordControler,
                    //   decoration: InputDecoration(
                    //       prefixIcon: Icon(Icons.vpn_key),
                    //       labelText: 'Enter password',
                    //       errorText: _validatePass
                    //           ? null
                    //           : 'Password field can\'t be empty',
                    //       border: OutlineInputBorder(
                    //           borderSide:
                    //               BorderSide(color: Colors.grey, width: 2.0))),
                    //   obscureText: true,
                    // ),
                    Theme(
                      child: TextField(
                        //autofocus: true,
                        controller: passwordControler,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.vpn_key),
                            labelText: 'Enter password',
                            errorText: _validatePass
                                ? null
                                : (passwordControler.text.length == 0)
                                    ? 'Password field can\'t be empty'
                                    : 'Password too short',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey, width: 2.0))),
                        obscureText: true,
                      ),
                      data: Theme.of(context).copyWith(
                        primaryColor: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Theme(
                      child: TextFormField(
                        controller: phoneControler,
                        keyboardType: TextInputType.number,
                        autofocus: true,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone_android),
                            labelText: 'Enter phone number',
                            errorText:
                                _validatePhone ? null : 'Check your number',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey, width: 2.0))),
                      ),
                      data: Theme.of(context).copyWith(
                        primaryColor: Colors.grey[600],
                      ),
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
                          setState(() {
                            if (!(validatePhone(phoneControler.text) &&
                                validatePass(passwordControler.text) &&
                                userControler.text.isValidEmail())) {
                              validatePhone(phoneControler.text)
                                  ? _validatePhone = true
                                  : _validatePhone = false;
                              validatePass(passwordControler.text)
                                  ? _validatePass = true
                                  : _validatePass = false;
                              userControler.text.isValidEmail()
                                  ? _validateEmail = true
                                  : _validateEmail = false;
                            } else {
                              _validateEmail = true;
                              _validatePass = true;
                              _validatePhone = true;
                              if (userControler.text.isValidEmail()) {
                                createRecord();
                                secondscreenfunkcija(context);
                                onPressed();
                              }
                            }
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 20.0),
                    OutlineButton(
                      splashColor: Colors.grey,
                      onPressed: () {
                        _homeScreen = !_homeScreen;
                        signInWithGoogle().whenComplete(() {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return GoogleScreen();
                            },
                          ));
                        });
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      highlightElevation: 0,
                      borderSide: BorderSide(color: Colors.grey),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image(
                              image: AssetImage("assets/google_logo.png"),
                              height: 35.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text('Sign in with Google',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.grey,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      onWillPop: () => showDialog<bool>(
        context: context,
        builder: (c) => AlertDialog(
            title: Text('Warning'),
            content: Text('Do you really want to exit'),
            actions: [
              FlatButton(
                child: Text('Yes'),
                onPressed: () => Navigator.pop(c, true),
              ),
              FlatButton(
                child: Text('No'),
                onPressed: () => Navigator.pop(c, false),
              )
            ]),
      ),
    );
  }

  void onPressed() async {
    final firestoreInstance = Firestore.instance;
    firestoreInstance.collection("users").getDocuments().then((querySnapshot) {
      querySnapshot.documents.forEach((result) {
        print(result.data);
      });
    });
  }

  void secondscreenfunkcija(BuildContext context) {
    String username = userControler.text;
    String password = passwordControler.text;
    userControler.clear();
    passwordControler.clear();
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Home(user: username, pass: password),
        ));
  }
}

bool validatePhone(String phone) {
  if (phone == '') {
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

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
