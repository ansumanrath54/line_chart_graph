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
            body: Center(
              child: Container(
                width: 300,
                height: 250,
                child: SfCartesianChart(
                  //title: ChartTitle(text: 'Pedometer Analysis', textStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                  //legend: Legend(isVisible: true),
                  enableAxisAnimation: true,
                  backgroundColor: Colors.white,
                  //borderColor: Colors.white,
                  //plotAreaBackgroundColor: Color(0xff020227),
                  tooltipBehavior: _tooltipBehavior,
                  zoomPanBehavior: _zoomPanBehavior,
                  series: <ChartSeries>[
                    SplineAreaSeries<ChartData, String>(
                      name: "",
                      dataSource: _chartData,
                      xValueMapper: (ChartData data, _) => data.date,
                      yValueMapper: (ChartData data, _) => data.steps,
                      //dataLabelSettings: DataLabelSettings(isVisible: true),
                      enableTooltip: false,
                      //color: const Color(0xff6848D3),
                      //borderColor: const Color.fromRGBO(75, 135, 185, 1),
                      borderWidth: 2,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end:  Alignment.bottomCenter,
                        colors: [
                        Color(0xffFB7900),
                        Color(0xff6848D3)
                      ],)
                    )
                  ],
                  primaryXAxis: CategoryAxis(
                    //title: AxisTitle(text: "Date", textStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                    edgeLabelPlacement: EdgeLabelPlacement.shift,
                    interval: 1,
                    name: 'Date',
                    majorGridLines: MajorGridLines(width: 0),
                    visibleMinimum: 0,
                    visibleMaximum: 3
                  ),
                  primaryYAxis: NumericAxis(
                    //title: AxisTitle(text: "Steps", textStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                    interval: 100,
                      majorGridLines: MajorGridLines(width: 0),
                    visibleMinimum: 0,
                    visibleMaximum: maxVerticalAxis(),
                  ),
                ),
              ),
            )));
  }
}

double maxVerticalAxis() {
  double d;
  if(getMax()%100 == 0)
    d = getMax().toDouble();
  else
    d = ((getMax()/100)+1)*100;
  return d;
}

