
class ChartData {
  ChartData(this.date, this.steps);
  final String date;
  final int steps;
}

List<ChartData> getChartData() {
  final List<ChartData> chartData = [
    ChartData("Sept 1",0),
    ChartData("Sept 2",60),
    ChartData("Sept 3",20),
    ChartData("Sept 4",10),
    ChartData("Sept 5",120),
    ChartData("Sept 6",150),
    ChartData("Sept 7",80),
    ChartData("Sept 8",60),
    ChartData("Sept 9",150),
    ChartData("Sept 10",130),
    ChartData("Sept 11",200),
    ChartData("Sept 12",200),
    ChartData("Sept 13",110),
    ChartData("Sept 14",190),
    ChartData("Sept 15",80),
    ChartData("Sept 16",10),
    ChartData("Sept 17",30),
    ChartData("Sept 18",50),
    ChartData("Sept 19",70),
    ChartData("Sept 20",90),
    ChartData("Sept 21",140),
    ChartData("Sept 22",160),
    ChartData("Sept 23",130),
    ChartData("Sept 24",200),
    ChartData("Sept 25",210),
    ChartData("Sept 26",220),
    ChartData("Sept 27",200),
    ChartData("Sept 28",230),
    ChartData("Sept 29",170),
    ChartData("Sept 30",150),
  ];
  return chartData;
}