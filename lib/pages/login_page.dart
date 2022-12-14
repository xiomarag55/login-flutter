import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/src/material/icons.dart';
import 'package:http/http.dart' as http;
import 'package:supervisiones_con_flutter_2/pages/dashboard.dart';
import 'package:supervisiones_con_flutter_2/pages/register.dart';

import '../classes/user.dart';
import '../utils/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  User user = User("", "");
  String url = "http://localhost:8080/a";
  Future save() async {
    await http.get('$url?user=${user.username}&&pass=${user.password}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            
            children: [
              Form(
                key: _formKey,
                child: Column(
                  
                  children: [
                    Container(
                      height: 750,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius:
                              BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          Text(
                            "Login",
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
                                  errorStyle:
                                      TextStyle(fontSize: 20, color: Colors.white),
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
                                errorStyle:
                                    TextStyle(fontSize: 20, color: Colors.white),
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RegisterPage()));
                              },
                              child: Text(
                                "Dont have Account ?",
                                style: GoogleFonts.roboto(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DashBoardPage()));
                              },
                              
                              child: Center(
                                child: Text(
                                  "Entrar",
                                  style: GoogleFonts.roboto(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
