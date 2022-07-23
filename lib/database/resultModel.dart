class ResultModel {
  late String resultString;
  late String date;
  late String month;
  late String year;
  late String hours;
  late String minute;

  ResultModel({
    required this.resultString,
    required this.date,
    required this.month,
    required this.year,
    required this.hours,
    required this.minute,
  });

  factory ResultModel.fromMap(Map<String, dynamic> map) {
    return ResultModel(
      resultString: map["resultString"],
      date: map["date"],
      month: map["month"],
      year: map["year"],
      hours: map["hours"],
      minute: map["minutes"],
    );
  }

  Map<String, dynamic> toJson() => {
        "resultString": resultString,
        "date": date,
        "month": month,
        "year": year,
        "hours": hours,
        "minutes": minute
      };
}
