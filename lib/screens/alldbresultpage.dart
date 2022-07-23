import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tictactoe/database/databaseHelper.dart';
import 'package:tictactoe/database/resultModel.dart';
import 'package:tictactoe/screens/design.dart';

class AllDbResult extends StatefulWidget {
  @override
  State<AllDbResult> createState() => _AllDbResultState();
}

class _AllDbResultState extends State<AllDbResult> {
  DBHelper? dbHelper;
  late Future<List<ResultModel>> resList;

  void initState() {
    super.initState();
    dbHelper = DBHelper.instance;
    loadData();
  }

  loadData() async {
    resList = dbHelper!.getResultList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Design.appBarData,
      body: SizedBox(
        height: 600,
        child: FutureBuilder(
            future: resList,
            builder: (context, AsyncSnapshot<List<ResultModel>> snapshot) {
              return (snapshot.data != null)
                  ? ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 7,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              contentPadding: EdgeInsets.all(0),
                              title: Text(
                                snapshot.data![index].resultString.toString(),
                                style: TextStyle(fontWeight: FontWeight.w700),
                                textScaleFactor: 1.15,
                              ),
                              trailing: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                        snapshot.data![index].hours.toString() +
                                            " : " +
                                            snapshot.data![index].minute
                                                .toString()),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(snapshot.data![index].date.toString() +
                                        "/" +
                                        snapshot.data![index].month.toString() +
                                        "/" +
                                        snapshot.data![index].year.toString()),
                                    SizedBox(
                                      height: 4,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      })
                  : CircularProgressIndicator();
            }),
      ),
    );
  }
}
