import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tictactoe/screens/design.dart';
import 'package:tictactoe/screens/hopepage.dart';

import '../routes.dart';

class ResultPage extends StatefulWidget {
  static List<int> resultList = [];
  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late int player1Wins;
  late int player2Wins;
  late int draws;
  void initState() {
    super.initState();
    player1Wins = player2Wins = draws = 0;
    for (int i = 0; i < ResultPage.resultList.length; i++) {
      if (ResultPage.resultList[i] == 0) {
        draws++;
      } else if (ResultPage.resultList[i] == 1) {
        player1Wins++;
      } else {
        player2Wins++;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Design.appBarData,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 360,
              width: 370,
              decoration: BoxDecoration(
                  color: Colors.cyan.withOpacity(0.2),
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 2,
                    width: 350,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 120,
                          alignment: Alignment.center,
                          child: Text(
                            HomePage.player1,
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                              fontSize: 23,
                            )),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.cyan.withOpacity(0.8),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 50,
                          width: 90,
                          alignment: Alignment.center,
                          child: Text(
                            "V S",
                            style: GoogleFonts.alike(
                                textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                              fontSize: 23,
                            )),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.cyan.withOpacity(0.4),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 50,
                          width: 120,
                          alignment: Alignment.center,
                          child: Text(
                            HomePage.player2,
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                              fontSize: 23,
                            )),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.cyan.withOpacity(0.8),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Container(
                    height: 2,
                    width: 350,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 120,
                          alignment: Alignment.center,
                          child: Text(
                            ResultPage.resultList.length.toString(),
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                              fontSize: 23,
                            )),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.cyan.withOpacity(0.4),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 50,
                          width: 90,
                          alignment: Alignment.center,
                          child: Text(
                            "Games",
                            style: GoogleFonts.alike(
                                textStyle: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              fontSize: 20,
                            )),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.cyan.withOpacity(0.8),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 50,
                          width: 120,
                          alignment: Alignment.center,
                          child: Text(
                            ResultPage.resultList.length.toString(),
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                              fontSize: 23,
                            )),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.cyan.withOpacity(0.4),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 120,
                          alignment: Alignment.center,
                          child: Text(
                            player1Wins.toString(),
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                              fontSize: 23,
                            )),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.cyan.withOpacity(0.4),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 50,
                          width: 90,
                          alignment: Alignment.center,
                          child: Text(
                            "Wins",
                            style: GoogleFonts.alike(
                                textStyle: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              fontSize: 20,
                            )),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.cyan.withOpacity(0.8),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 50,
                          width: 120,
                          alignment: Alignment.center,
                          child: Text(
                            player2Wins.toString(),
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                              fontSize: 23,
                            )),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.cyan.withOpacity(0.4),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 120,
                          alignment: Alignment.center,
                          child: Text(
                            draws.toString(),
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                              fontSize: 23,
                            )),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.cyan.withOpacity(0.4),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 50,
                          width: 90,
                          alignment: Alignment.center,
                          child: Text(
                            "Draws",
                            style: GoogleFonts.alike(
                                textStyle: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              fontSize: 20,
                            )),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.cyan.withOpacity(0.8),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 50,
                          width: 120,
                          alignment: Alignment.center,
                          child: Text(
                            draws.toString(),
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                              fontSize: 23,
                            )),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.cyan.withOpacity(0.4),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Container(
                    height: 2,
                    width: 350,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 120,
                          alignment: Alignment.center,
                          child: Text(
                            ((player1Wins * 20) + (draws * 10)).toString(),
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                              fontSize: 25,
                            )),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.cyan.withOpacity(0.4),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 50,
                          width: 90,
                          alignment: Alignment.center,
                          child: Text(
                            "Score",
                            style: GoogleFonts.alike(
                                textStyle: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              fontSize: 23,
                            )),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.cyan.withOpacity(0.8),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 50,
                          width: 120,
                          alignment: Alignment.center,
                          child: Text(
                            ((player2Wins * 20) + (draws * 10)).toString(),
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                              fontSize: 25,
                            )),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.cyan.withOpacity(0.4),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () => {
              Navigator.pushNamed(context, MyRoutes.routeToss),
            },
            child: Container(
              height: 50,
              width: 200,
              child: Text(
                "Play Again",
                style: GoogleFonts.alike(
                    textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 23,
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
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () => {
              ResultPage.resultList.clear(),
              Navigator.pushNamed(context, MyRoutes.routeHome),
            },
            child: Container(
              height: 50,
              width: 200,
              child: Text(
                "Home",
                style: GoogleFonts.alike(
                    textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 23,
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
          ),
        ],
      ),
    );
  }
}
