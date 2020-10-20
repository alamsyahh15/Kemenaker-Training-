import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                      Text("Register Please"),
                      TextFormField(
                        decoration: InputDecoration(hintText: "Fullname"),
                      ),
                      TextFormField(
                        decoration: InputDecoration(hintText: "Username"),
                      ),
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
                          child: Text("Register"),
                          onPressed: () {
                            Navigator.pop(context);
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
                        child: Text("I have an account ?"),
                        onPressed: () {
                            Navigator.pop(context);
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
