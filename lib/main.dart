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
    _zoomPanBehavior = ZoomPanBehavior(enablePanning: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
            body: Center(
              child: Container(
                width: 350, height: 280,
                child: SfCartesianChart(
                  title: ChartTitle(text: "Steps vs Day"),
                  enableAxisAnimation: false,
                  backgroundColor: Colors.white,
                  tooltipBehavior: _tooltipBehavior,
                  zoomPanBehavior: _zoomPanBehavior,
                  plotAreaBorderWidth: 0,
                  series: <ChartSeries>[
                    SplineAreaSeries<ChartData, String>(
                      name: "",
                      dataSource: _chartData,
                      xValueMapper: (ChartData data, _) => data.date,
                      yValueMapper: (ChartData data, _) => data.steps,
                      enableTooltip: true,
                      borderWidth: 4,
                      borderColor: Color(0xff6848D3),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end:  Alignment.bottomCenter,
                        colors: [
                          Color(0xff6848D3),
                          Color(0xff6848D3),
                          Color(0xffFB7900),
                      ],)
                    )
                  ],
                  primaryXAxis: CategoryAxis(
                    edgeLabelPlacement: EdgeLabelPlacement.shift,
                    interval: 1,
                      majorTickLines: MajorTickLines(size: 0),
                    majorGridLines: MajorGridLines(width: 0),
                    visibleMaximum: 3
                  ),
                  primaryYAxis: NumericAxis(
                    interval: maxVerticalAxis()/10,
                      majorTickLines: MajorTickLines(size: 0),
                      majorGridLines: MajorGridLines(width: 0),
                    visibleMaximum: maxVerticalAxis().toDouble(),
                  ),
                ),
              ),
            )));
  }
}

int maxVerticalAxis() {
  int d = getMax();
  if(d%1000 != 0) {
    d = (d~/1000 + 1) * 1000;
  }
  return d;
}

