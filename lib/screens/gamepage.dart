import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tictactoe/database/databaseHelper.dart';
import 'package:tictactoe/database/resultModel.dart';
import 'package:tictactoe/routes.dart';
import 'package:tictactoe/screens/design.dart';
import 'package:tictactoe/screens/hopepage.dart';
import 'package:tictactoe/screens/resultpage.dart';
import 'package:tictactoe/screens/tosspage.dart';

class GamePage extends StatefulWidget {
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  DBHelper? dbHelper;

  late String resultString;
  late String year;
  late String month;
  late String date;
  late String hours;
  late String minute;

  late DateTime? day = null;
  late TimeOfDay? time = null;

  void pushData(String rstr) {
    resultString = rstr;
    day = DateTime.now();
    time = TimeOfDay.now();
    date = (day!.day < 10) ? "0" + day!.day.toString() : day!.day.toString();
    month =
        (day!.month < 10) ? "0" + day!.month.toString() : day!.month.toString();
    year = day!.year.toString();
    hours =
        (time!.hour < 10) ? "0" + time!.hour.toString() : time!.hour.toString();
    minute = (time!.minute < 10)
        ? "0" + time!.minute.toString()
        : time!.minute.toString();

    pushResult();
  }

  void pushResult() async {
    ResultModel resdata = new ResultModel(
        resultString: this.resultString,
        date: this.date,
        month: this.month,
        year: this.year,
        hours: this.hours,
        minute: this.minute);

    dbHelper!.insert(resdata).then((value) {
      print("Pushed in db successfully !!!");
    }).onError((error, stackTrace) {
      print(error.toString());
    });
  }

  List boxes = [
    {},
    {"id": 1, "checked": false, "xchecked": false, "ochecked": false},
    {"id": 2, "checked": false, "xchecked": false, "ochecked": false},
    {"id": 3, "checked": false, "xchecked": false, "ochecked": false},
    {"id": 4, "checked": false, "xchecked": false, "ochecked": false},
    {"id": 5, "checked": false, "xchecked": false, "ochecked": false},
    {"id": 6, "checked": false, "xchecked": false, "ochecked": false},
    {"id": 7, "checked": false, "xchecked": false, "ochecked": false},
    {"id": 8, "checked": false, "xchecked": false, "ochecked": false},
    {"id": 9, "checked": false, "xchecked": false, "ochecked": false},
  ];
  bool xturn = true;
  bool yturn = false;
  int winCase = 0;
  bool isDraw = false;
  bool isWin = false;
  bool gameEnd = false;
  int counter = 0;
  static String firstChance = "";
  static String secondChance = "";

  void initState() {
    super.initState();
    firstChance = TossPage.firstPlay;
    secondChance = TossPage.secondPlay;
    gameEnd = false;
    dbHelper = DBHelper.instance;
  }

  boxClicked(id) {
    counter++;

    if (xturn) {
      boxes[id]["checked"] = true;
      boxes[id]["xchecked"] = true;
      xturn = false;
      yturn = true;
    } else if (yturn) {
      boxes[id]["checked"] = true;
      boxes[id]["ochecked"] = true;
      xturn = true;
      yturn = false;
    }
    setState(() {});
    if (isWinFun()) {
      isWin = true;
      if (winCase <= 8) {
        if (firstChance == HomePage.player1) {
          pushData("${firstChance}  beat  ${secondChance}");
          ResultPage.resultList.add(1);
        } else {
          ResultPage.resultList.add(2);
          pushData("${firstChance}  beat  ${secondChance}");
        }
      } else {
        if (secondChance == HomePage.player1) {
          ResultPage.resultList.add(1);
          pushData("${secondChance} +  beat  ${firstChance}");
        } else {
          ResultPage.resultList.add(2);
          pushData("${secondChance} +  beat  ${firstChance}");
        }
      }
      showWinDialog(context);
      gameEnd = true;
    }

    if (counter >= 9 && !(isWin)) {
      isDraw = true;
      ResultPage.resultList.add(0);
      pushData("${firstChance}  tied with  ${secondChance}");
      showDrawDialog(context);
      gameEnd = true;
    }
  }

  isWinFun() {
    if (boxes[1]["xchecked"] && boxes[4]["xchecked"] && boxes[7]["xchecked"]) {
      winCase = 1;
      return true;
    } else if (boxes[2]["xchecked"] &&
        boxes[5]["xchecked"] &&
        boxes[8]["xchecked"]) {
      winCase = 2;
      return true;
    } else if (boxes[3]["xchecked"] &&
        boxes[6]["xchecked"] &&
        boxes[9]["xchecked"]) {
      winCase = 3;
      return true;
    } else if (boxes[1]["xchecked"] &&
        boxes[2]["xchecked"] &&
        boxes[3]["xchecked"]) {
      winCase = 4;
      return true;
    } else if (boxes[4]["xchecked"] &&
        boxes[5]["xchecked"] &&
        boxes[6]["xchecked"]) {
      winCase = 5;
      return true;
    } else if (boxes[7]["xchecked"] &&
        boxes[8]["xchecked"] &&
        boxes[9]["xchecked"]) {
      winCase = 6;
      return true;
    } else if (boxes[1]["xchecked"] &&
        boxes[5]["xchecked"] &&
        boxes[9]["xchecked"]) {
      winCase = 7;
      return true;
    } else if (boxes[3]["xchecked"] &&
        boxes[5]["xchecked"] &&
        boxes[7]["xchecked"]) {
      winCase = 8;
      return true;
    } else if (boxes[1]["ochecked"] &&
        boxes[4]["ochecked"] &&
        boxes[7]["ochecked"]) {
      winCase = 9;
      return true;
    } else if (boxes[2]["ochecked"] &&
        boxes[5]["ochecked"] &&
        boxes[8]["ochecked"]) {
      winCase = 10;
      return true;
    } else if (boxes[3]["ochecked"] &&
        boxes[6]["ochecked"] &&
        boxes[9]["ochecked"]) {
      winCase = 11;
      return true;
    } else if (boxes[1]["ochecked"] &&
        boxes[2]["ochecked"] &&
        boxes[3]["ochecked"]) {
      winCase = 12;
      return true;
    } else if (boxes[4]["ochecked"] &&
        boxes[5]["ochecked"] &&
        boxes[6]["ochecked"]) {
      winCase = 13;
      return true;
    } else if (boxes[7]["ochecked"] &&
        boxes[8]["ochecked"] &&
        boxes[9]["ochecked"]) {
      winCase = 14;
      return true;
    } else if (boxes[1]["ochecked"] &&
        boxes[5]["ochecked"] &&
        boxes[9]["ochecked"]) {
      winCase = 15;
      return true;
    } else if (boxes[3]["ochecked"] &&
        boxes[5]["ochecked"] &&
        boxes[7]["ochecked"]) {
      winCase = 16;
      return true;
    } else {
      return false;
    }
  }

  showDrawDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              children: [
                Container(
                    child: Column(
                  children: [
                    Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height / 7,
                        width: 250,
                        alignment: Alignment.center,
                        child: Text(
                          "Game Draw",
                          style: GoogleFonts.alike(
                              textStyle: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                            fontSize: 40,
                          )),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.cyan.withOpacity(0.4),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.black, width: 3),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () => {
                        Navigator.pushNamed(context, MyRoutes.routeToss),
                      },
                      child: Container(
                        height: 60,
                        width: 210,
                        child: Text(
                          "Play Again",
                          style: GoogleFonts.alike(
                              textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
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
                        Navigator.pushNamed(context, MyRoutes.routeResult),
                      },
                      child: Container(
                        height: 60,
                        width: 210,
                        child: Text(
                          "Results",
                          style: GoogleFonts.alike(
                              textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
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
                        height: 60,
                        width: 210,
                        child: Text(
                          "Home",
                          style: GoogleFonts.alike(
                              textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
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
                )),
              ],
            ));
  }

  showWinDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              children: [
                Container(
                    child: Column(
                  children: [
                    Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height / 7,
                        width: 250,
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Congratulations",
                              style: GoogleFonts.alike(
                                  textStyle: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Colors.black,
                                fontSize: 25,
                              )),
                            ),
                            Text(
                              (winCase <= 8)
                                  ? (firstChance + " won")
                                  : (secondChance + " won"),
                              style: GoogleFonts.alike(
                                  textStyle: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Colors.red,
                                fontSize: 25,
                              )),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Colors.cyan.withOpacity(0.4),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.black, width: 3),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () => {
                        Navigator.pushNamed(context, MyRoutes.routeToss),
                      },
                      child: Container(
                        height: 60,
                        width: 210,
                        child: Text(
                          "Play Again",
                          style: GoogleFonts.alike(
                              textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
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
                        Navigator.pushNamed(context, MyRoutes.routeResult),
                      },
                      child: Container(
                        height: 60,
                        width: 210,
                        child: Text(
                          "Results",
                          style: GoogleFonts.alike(
                              textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
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
                        height: 60,
                        width: 210,
                        child: Text(
                          "Home",
                          style: GoogleFonts.alike(
                              textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
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
                )),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Design.appBarData,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                (!isWin && !isDraw)
                    ? (((xturn) ? firstChance : secondChance) + "'s chance")
                    : "",
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 350,
                width: 350,
                child: Row(
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: () => {
                            ((!isWin) && !(boxes[1]["checked"]))
                                ? boxClicked(1)
                                : null
                          },
                          child: Container(
                            child: ((boxes[1]["checked"] &&
                                    boxes[1]["xchecked"])
                                ? Design.xFilled
                                : (boxes[1]["checked"] && boxes[1]["ochecked"])
                                    ? Design.oFilled
                                    : null),
                            width: 350 / 3,
                            height: 350 / 3,
                            decoration: BoxDecoration(
                              color: Colors.cyan.withOpacity(0.3),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              border: Border.all(
                                color: Colors.white,
                                width: 4,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => {
                            ((!isWin) && !(boxes[4]["checked"]))
                                ? boxClicked(4)
                                : null
                          },
                          child: Container(
                            child: ((boxes[4]["checked"] &&
                                    boxes[4]["xchecked"])
                                ? Design.xFilled
                                : (boxes[4]["checked"] && boxes[4]["ochecked"])
                                    ? Design.oFilled
                                    : null),
                            width: 350 / 3,
                            height: 350 / 3,
                            decoration: BoxDecoration(
                              color: Colors.cyan.withOpacity(0.2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              border: Border.all(
                                color: Colors.white,
                                width: 4,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => {
                            ((!isWin) && !(boxes[7]["checked"]))
                                ? boxClicked(7)
                                : null
                          },
                          child: Container(
                            child: ((boxes[7]["checked"] &&
                                    boxes[7]["xchecked"])
                                ? Design.xFilled
                                : (boxes[7]["checked"] && boxes[7]["ochecked"])
                                    ? Design.oFilled
                                    : null),
                            width: 350 / 3,
                            height: 350 / 3,
                            decoration: BoxDecoration(
                              color: Colors.cyan.withOpacity(0.3),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              border: Border.all(
                                color: Colors.white,
                                width: 4,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () => {
                            ((!isWin) && !(boxes[2]["checked"]))
                                ? boxClicked(2)
                                : null
                          },
                          child: Container(
                            child: ((boxes[2]["checked"] &&
                                    boxes[2]["xchecked"])
                                ? Design.xFilled
                                : (boxes[2]["checked"] && boxes[2]["ochecked"])
                                    ? Design.oFilled
                                    : null),
                            width: 350 / 3,
                            height: 350 / 3,
                            decoration: BoxDecoration(
                              color: Colors.cyan.withOpacity(0.2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              border: Border.all(
                                color: Colors.white,
                                width: 4,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => {
                            ((!isWin) && !(boxes[5]["checked"]))
                                ? boxClicked(5)
                                : null
                          },
                          child: Container(
                            child: ((boxes[5]["checked"] &&
                                    boxes[5]["xchecked"])
                                ? Design.xFilled
                                : (boxes[5]["checked"] && boxes[5]["ochecked"])
                                    ? Design.oFilled
                                    : null),
                            width: 350 / 3,
                            height: 350 / 3,
                            decoration: BoxDecoration(
                              color: Colors.cyan.withOpacity(0.3),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              border: Border.all(
                                color: Colors.white,
                                width: 4,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => {
                            ((!isWin) && !(boxes[8]["checked"]))
                                ? boxClicked(8)
                                : null
                          },
                          child: Container(
                            child: ((boxes[8]["checked"] &&
                                    boxes[8]["xchecked"])
                                ? Design.xFilled
                                : (boxes[8]["checked"] && boxes[8]["ochecked"])
                                    ? Design.oFilled
                                    : null),
                            width: 350 / 3,
                            height: 350 / 3,
                            decoration: BoxDecoration(
                              color: Colors.cyan.withOpacity(0.2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              border: Border.all(
                                color: Colors.white,
                                width: 4,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () => {
                            ((!isWin) && !(boxes[3]["checked"]))
                                ? boxClicked(3)
                                : null
                          },
                          child: Container(
                            child: ((boxes[3]["checked"] &&
                                    boxes[3]["xchecked"])
                                ? Design.xFilled
                                : (boxes[3]["checked"] && boxes[3]["ochecked"])
                                    ? Design.oFilled
                                    : null),
                            width: 350 / 3,
                            height: 350 / 3,
                            decoration: BoxDecoration(
                              color: Colors.cyan.withOpacity(0.3),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              border: Border.all(
                                color: Colors.white,
                                width: 4,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => {
                            ((!isWin) && !(boxes[6]["checked"]))
                                ? boxClicked(6)
                                : null
                          },
                          child: Container(
                            child: ((boxes[6]["checked"] &&
                                    boxes[6]["xchecked"])
                                ? Design.xFilled
                                : (boxes[6]["checked"] && boxes[6]["ochecked"])
                                    ? Design.oFilled
                                    : null),
                            width: 350 / 3,
                            height: 350 / 3,
                            decoration: BoxDecoration(
                              color: Colors.cyan.withOpacity(0.2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              border: Border.all(
                                color: Colors.white,
                                width: 4,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => {
                            ((!isWin) && !(boxes[9]["checked"]))
                                ? boxClicked(9)
                                : null
                          },
                          child: Container(
                            child: ((boxes[9]["checked"] &&
                                    boxes[9]["xchecked"])
                                ? Design.xFilled
                                : (boxes[9]["checked"] && boxes[9]["ochecked"])
                                    ? Design.oFilled
                                    : null),
                            width: 350 / 3,
                            height: 350 / 3,
                            decoration: BoxDecoration(
                              color: Colors.cyan.withOpacity(0.3),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              border: Border.all(
                                color: Colors.white,
                                width: 4,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: (gameEnd)
                    ? InkWell(
                        onTap: () => {
                          Navigator.pushNamed(context, MyRoutes.routeResult),
                        },
                        child: Container(
                          height: 60,
                          width: 210,
                          child: Text(
                            "Results",
                            style: GoogleFonts.alike(
                                textStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 25,
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
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
