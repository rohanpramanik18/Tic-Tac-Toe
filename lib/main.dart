import 'package:flutter/material.dart';
import 'package:tictactoe/routes.dart';
import 'package:tictactoe/screens/alldbresultpage.dart';
import 'package:tictactoe/screens/gamepage.dart';
import 'package:tictactoe/screens/hopepage.dart';
import 'package:tictactoe/screens/resultpage.dart';
import 'screens/tosspage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        primaryColor: Colors.white,
      ),
      routes: {
        MyRoutes.routeHome: (context) => HomePage(),
        MyRoutes.routeToss: (context) => TossPage(),
        MyRoutes.routeGame: (context) => GamePage(),
        MyRoutes.routeResult: (context) => ResultPage(),
        MyRoutes.routealldbresult: (context) => AllDbResult()
      },
      initialRoute: "/home",
    );
  }
}
