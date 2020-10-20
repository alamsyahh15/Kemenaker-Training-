import 'package:flutter/material.dart';

import 'register_page.dart';
import 'screen/page_home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(16),
              child: Card(
                elevation: 5,
                child: Container(
                  margin: EdgeInsets.all(16),
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.person, size: 50),
                      Text("Login Please"),
                      TextFormField(
                        decoration: InputDecoration(hintText: "Email Address"),
                      ),
                      TextFormField(
                        autovalidate: true,
                        validator: (val) => val.length < 8 ? "Minimal least password 8 character" : null,
                        decoration: InputDecoration(hintText: "Password"),
                      ),
                      
                      Container(
                        margin: EdgeInsets.only(top: 16, bottom: 16),
                        width: double.infinity,
                        height: 45,
                        child: RaisedButton(
                          color: Colors.green,
                          textColor: Colors.white,
                          child: Text("Login"),
                          onPressed: () {
                            Navigator.push(context,MaterialPageRoute(builder:(context) => PageHome()) );
                          },
                        ),
                      ),
                      Text(
                        "Or",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      FlatButton(
                        child: Text("I don't have a account ?"),
                        onPressed: () {
                          Navigator.push(context,MaterialPageRoute(builder:(context) => RegisterPage()) );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
