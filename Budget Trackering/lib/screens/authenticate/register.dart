import 'package:brew_crew/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/shared/loading.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({required this.toggleView});

  //const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.pink[100],
            appBar: AppBar(
              actions: <Widget>[
                TextButton.icon(
                  onPressed: () {
                    widget.toggleView();
                  },
                  icon: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  label: Text(
                    "Sign In",
                    style: TextStyle(color: Colors.black),
                  ),
                )
              ],
              backgroundColor: Colors.pink[400],
              elevation: 0.0,
              title: Text("Sign Up to Brew Crew"),
            ),
            body: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                child: Form(
                  key: _formkey,
                  child: Column(children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration:
                          textinputdecoration.copyWith(hintText: "Email"),
                      validator: (val) =>
                          val!.isEmpty ? "Enter an email" : null,
                      onChanged: (val) {
                        setState(() {
                          email = val;
                        });
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration:
                          textinputdecoration.copyWith(hintText: "Password"),
                      validator: (val) => val!.length < 6
                          ? "Enter an Password 6+ chars long"
                          : null,
                      obscureText: true,
                      onChanged: (val) {
                        setState(() {
                          password = val;
                        });
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink,
                        ),
                        onPressed: () async {
                          if (_formkey.currentState!.validate()) {
                            setState(() {
                              loading = true;
                            });
                            dynamic result = await _auth
                                .registerWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(() {
                                error = "Please Supply a Valid Email";
                                loading = false;
                              });
                            }
                          }
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                    SizedBox(height: 12.0),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),
                    )
                  ]),
                )),
          );
  }
}
