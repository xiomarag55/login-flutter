import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/src/material/icons.dart';
import 'package:http/http.dart' as http;

import '../classes/user.dart';
import '../utils/constants.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  User user = User("", "");
  String url = "http://localhost:8080/a";
  Future save() async {
    /* var res =  await http.post(url, headers: {'Context-Type': 'application/json'}, body: json.encode({
      'username': user.username, 'password': user.password}
    )); */
    var res =
        await http.get('$url?user=${user.username}&&pass=${user.password}');
    //print(res.body);
    if (res.body != null) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                height: 700,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(30))),
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Text(
                      "Register",
                      style: GoogleFonts.pacifico(
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          color: Colors.white),
                    ),
                    //username

                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Email",
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Color.fromRGBO(255, 255, 255, 0.8),
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: TextEditingController(text: user.username),
                      onChanged: (val) {
                        user.username = val;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email is empty';
                        }
                        return '';
                      },
                      style: TextStyle(fontSize: 30, color: Colors.white),
                      decoration: InputDecoration(
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                    ),
                    Container(
                      height: 8,
                      color: Color.fromRGBO(255, 255, 255, 0.4),
                    ),
                    SizedBox(height: 30),

                    //password
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Password",
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Color.fromRGBO(255, 255, 255, 0.8),
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: TextEditingController(text: user.password),
                      onChanged: (val) {
                        user.password = val;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password is empty';
                        }
                        return '';
                      },
                      style: TextStyle(fontSize: 30, color: Colors.white),
                      decoration: InputDecoration(
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                    ),
                    Container(
                      height: 8,
                      color: Color.fromRGBO(255, 255, 255, 0.4),
                    ),
                    SizedBox(height: 30),
                    //Register

                    Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Already have Account ?",
                          style: GoogleFonts.roboto(
                              fontSize: 20, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: InkWell(
                      child: TextButton(
                        onPressed: () {
                          save();
                        },
                        child: Center(child: Text("Entrar",
                                  style: GoogleFonts.roboto(
                                      fontSize: 20, color: Colors.white),)),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
