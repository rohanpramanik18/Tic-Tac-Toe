import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tictactoe/routes.dart';
import 'package:tictactoe/screens/hopepage.dart';
import './design.dart';

class TossPage extends StatefulWidget {
  static int changeState = 0;
  static String firstPlay = "";
  static String secondPlay = "";
  @override
  State<TossPage> createState() => _TossPageState();
}

class _TossPageState extends State<TossPage> {
  void initState() {
    super.initState();
    TossPage.changeState = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Design.appBarData,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0, bottom: 50.0),
            child: Column(
              children: [
                Container(
                  height: 320,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.cyan.withOpacity(0.2),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Who will go first ?",
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                          fontWeight: FontWeight.w800,
                        )),
                        textScaleFactor: 2.0,
                      ),
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () => {
                              TossPage.changeState = 1,
                              TossPage.firstPlay = HomePage.player1,
                              TossPage.secondPlay = HomePage.player2,
                              setState(() {}),
                            },
                            child: Container(
                              child: Text(
                                HomePage.player1,
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: (TossPage.changeState == 1)
                                      ? Colors.black
                                      : Colors.white,
                                )),
                              ),
                              alignment: Alignment.center,
                              height: (TossPage.changeState == 1) ? 65 : 60,
                              width: (TossPage.changeState == 1) ? 130 : 120,
                              decoration: BoxDecoration(
                                color: Colors.cyan.withOpacity(0.85),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                border: (TossPage.changeState == 1)
                                    ? Border.all(color: Colors.black, width: 2)
                                    : null,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: (TossPage.changeState > 0) ? 30 : 40,
                          ),
                          InkWell(
                            onTap: () => {
                              TossPage.changeState = 2,
                              TossPage.firstPlay = HomePage.player2,
                              TossPage.secondPlay = HomePage.player1,
                              setState(() {}),
                            },
                            child: Container(
                              child: Text(
                                HomePage.player2,
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: (TossPage.changeState == 2)
                                      ? Colors.black
                                      : Colors.white,
                                )),
                              ),
                              alignment: Alignment.center,
                              height: (TossPage.changeState == 2) ? 65 : 60,
                              width: (TossPage.changeState == 2) ? 130 : 120,
                              decoration: BoxDecoration(
                                color: Colors.cyan.withOpacity(0.85),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                border: (TossPage.changeState == 2)
                                    ? Border.all(color: Colors.black, width: 2)
                                    : null,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 45,
                      ),
                      InkWell(
                        onTap: () {
                          if (TossPage.changeState > 0) {
                            Navigator.pushNamed(context, MyRoutes.routeGame);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Please select one player"),
                              duration: Duration(seconds: 1),
                            ));
                          }
                        },
                        child: Container(
                          height: 63,
                          width: 213,
                          child: Text(
                            "Start Game",
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              border: Border.all(
                                color: Colors.white,
                                width: 3,
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
