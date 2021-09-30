import 'package:intl/intl.dart';

class ChartData {
  ChartData(this.date, this.steps);
  String date;
  int steps;
}

List<ChartData> getChartData() {
  DateTime currDt = DateTime.now();
  final DateFormat formatter = DateFormat('dd-MM');
  List<ChartData> chartData = [
    ChartData("${formatter.format(currDt.add(Duration(days: 1)))}",0),
    ChartData("${formatter.format(currDt.add(Duration(days: 2)))}",8000),
    ChartData("${formatter.format(currDt.add(Duration(days: 3)))}",5080),
    ChartData("${formatter.format(currDt.add(Duration(days: 4)))}",4200),
    ChartData("${formatter.format(currDt.add(Duration(days: 5)))}",5500),
    ChartData("${formatter.format(currDt.add(Duration(days: 6)))}",3000),
    ChartData("${formatter.format(currDt.add(Duration(days: 7)))}",6000),
    ChartData("${formatter.format(currDt.add(Duration(days: 8)))}",3500),
    ChartData("${formatter.format(currDt.add(Duration(days: 9)))}",7300),
    ChartData("${formatter.format(currDt.add(Duration(days: 10)))}",4000),
    ChartData("${formatter.format(currDt.add(Duration(days: 11)))}",6000),
    ChartData("${formatter.format(currDt.add(Duration(days: 12)))}",4100),
    ChartData("${formatter.format(currDt.add(Duration(days: 13)))}",7900),
    ChartData("${formatter.format(currDt.add(Duration(days: 14)))}",8000),
    ChartData("${formatter.format(currDt.add(Duration(days: 15)))}",1040),
    ChartData("${formatter.format(currDt.add(Duration(days: 16)))}",3050),
    ChartData("${formatter.format(currDt.add(Duration(days: 17)))}",5040),
    ChartData("${formatter.format(currDt.add(Duration(days: 18)))}",7020),
    ChartData("${formatter.format(currDt.add(Duration(days: 19)))}",9080),
    ChartData("${formatter.format(currDt.add(Duration(days: 20)))}",3400),
    ChartData("${formatter.format(currDt.add(Duration(days: 21)))}",1600),
    ChartData("${formatter.format(currDt.add(Duration(days: 22)))}",1300),
    ChartData("${formatter.format(currDt.add(Duration(days: 23)))}",2000),
    ChartData("${formatter.format(currDt.add(Duration(days: 24)))}",2100),
    ChartData("${formatter.format(currDt.add(Duration(days: 25)))}",2200),
    ChartData("${formatter.format(currDt.add(Duration(days: 26)))}",2000),
    ChartData("${formatter.format(currDt.add(Duration(days: 27)))}",3300),
    ChartData("${formatter.format(currDt.add(Duration(days: 28)))}",5700),
    ChartData("${formatter.format(currDt.add(Duration(days: 29)))}",6500),
    ChartData("${formatter.format(currDt.add(Duration(days: 30)))}",6800),
    ChartData("${formatter.format(currDt.add(Duration(days: 31)))}",0),
  ];
  return chartData;
}

int getMax() {
  List <ChartData>? data = getChartData();
  int max = 0;
  for(int i=0;i<getChartData().length;i++) {
    if(max<data[i].steps)
      max = data[i].steps;
  }
  return max;
}
