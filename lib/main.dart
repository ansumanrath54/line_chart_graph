import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'chartdata.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: 'Flutter Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<ChartData> _chartData;
  late TooltipBehavior _tooltipBehavior;
  late ZoomPanBehavior _zoomPanBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    _zoomPanBehavior = ZoomPanBehavior(
      enablePanning: true,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SfCartesianChart(
              title: ChartTitle(text: 'Pedometer Analysis', textStyle: TextStyle(color: Colors.white70)),
              legend: Legend(isVisible: true),
              backgroundColor: Color(0xff020227),
              borderColor: Colors.white,
              tooltipBehavior: _tooltipBehavior,
              zoomPanBehavior: _zoomPanBehavior,
              series: <ChartSeries>[
                SplineAreaSeries<ChartData, String>(
                  name: "Pedometer",
                  dataSource: _chartData,
                  xValueMapper: (ChartData data, _) => data.date,
                  yValueMapper: (ChartData data, _) => data.steps,
                  dataLabelSettings: DataLabelSettings(isVisible: true),
                  enableTooltip: true,
                  color: const Color.fromRGBO(75, 135, 185, 0.6),
                  borderColor: const Color.fromRGBO(75, 135, 185, 1),
                  borderWidth: 2,
                )
              ],
              primaryXAxis: CategoryAxis(
                title: AxisTitle(text: "Date", textStyle: TextStyle(color: Colors.white70)),
                edgeLabelPlacement: EdgeLabelPlacement.shift,
                interval: 1,
                name: 'Date',
                majorGridLines: MajorGridLines(width: 0),
                visibleMinimum: 0,
                visibleMaximum: 4
              ),
              primaryYAxis: NumericAxis(
                title: AxisTitle(text: "Steps", textStyle: TextStyle(color: Colors.white70)),
                interval: 50,
                  majorGridLines: MajorGridLines(width: 0),
                visibleMinimum: 0,
                visibleMaximum: 300,
              ),
            )));
  }
}

