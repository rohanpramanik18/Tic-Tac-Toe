import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tictactoe/routes.dart';
import 'package:tictactoe/screens/resultpage.dart';

import 'design.dart';

class HomePage extends StatefulWidget {
  static String player1 = "";
  static String player2 = "";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Design.appBarData,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: 370,
            width: 300,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.cyan.withOpacity(0.2),
                borderRadius: new BorderRadius.all(Radius.circular(30))),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    TextFormField(
                      onChanged: (value) => {HomePage.player1 = value},
                      decoration: InputDecoration(
                        labelText: "Player 1",
                        hintText: "Enter Player 1's name",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Name cannot be empty";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 30),
                    TextFormField(
                      onChanged: (value) => {HomePage.player2 = value},
                      decoration: InputDecoration(
                        labelText: "Player 2",
                        hintText: "Enter Player 2's name",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Name cannot be empty";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 38),
                    InkWell(
                      onTap: () {
                        setState(() {});
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, MyRoutes.routeToss);
                        }
                      },
                      child: Container(
                        height: 63,
                        width: 213,
                        child: Text(
                          "Proceed",
                          style: GoogleFonts.alike(
                              textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Theme.of(context).primaryColor,
                          )),
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            border: Border.all(
                              color: Colors.white,
                              width: 3,
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
