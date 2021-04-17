import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Overview extends StatefulWidget {
  @override
  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  double screenHeight, screenWidth;

  var orderList=[1212121212,2312121212,4312121212,5612121212,4121212123,112121212];
  var revenueList=['1k','2k','3k','7k','4k','1k'];
  TextStyle textStyle1=TextStyle(
    fontSize: 18.0, 
    color: Colors.white
  );

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.all(20.0),
            color: Color(0xff151515),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 50.0),
                  Row(children: <Widget>[
                    TopCard(
                        screenHeight: screenHeight,
                        text1: "Total Orders",
                        text2: "444"),
                    SizedBox(width: 8.0),
                    TopCard(
                      screenHeight: screenHeight,
                      text1: "Total Revenue",
                      text2: "Rs. 39k",
                    )
                  ]),
                  SizedBox(height: 20.0),
                  Container(
                      padding: const EdgeInsets.all(15.0),
                      // height: 0.2*screenHeight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.black,
                      ),
                      child: Graph()),
                  SizedBox(height: 20.0),
                  Container(
                    height: 0.5 * screenHeight,
                    width: 0.95 * screenWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.black,
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Order ID and Revenue",
                            style: TextStyle(
                                fontWeight:FontWeight.bold,
                                fontSize: 20.0,
                                color: Colors.white),
                          ),
                        ),
                        Expanded(
                          child: listOrders()
                        )
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }

    Widget listOrders(){
      var listf=ListView.builder(
        itemCount: orderList.length,
        itemBuilder: (context,index){
          return Card(
            color: Colors.black,
            child: ListTile(
              title: Text(
                "${orderList[index]}",
                style: textStyle1,
                ),
              trailing: Text(
                "${revenueList[index]}",
                style: textStyle1,
                ),
              )
            );
      });
      return listf;
    }

}

class Graph extends StatelessWidget {
  const Graph({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        // Initialize category axis\
        primaryXAxis: CategoryAxis(majorGridLines: MajorGridLines(width: 0)
            // isVisible: false
            ),
        // backgroundColor: Colors.black,
        primaryYAxis: NumericAxis(
            // isVisible: false
            ),
        series: <SplineSeries<SalesData, String>>[
          SplineSeries<SalesData, String>(
            // Bind data source
            dataLabelSettings: DataLabelSettings(isVisible: true),
            color: Colors.yellow,
            dataSource: <SalesData>[
              SalesData('8', 10),
              SalesData('10', 12),
              SalesData('12', 30),
              SalesData('14', 10),
              SalesData('16', 50),
              SalesData('18', 33),
              SalesData('20', 80),
              SalesData('22', 50),
              SalesData('24', 60)
            ],
            xValueMapper: (SalesData sales, _) => sales.time,
            yValueMapper: (SalesData sales, _) => sales.sales,
            // yAxisName: "Number",
            // xAxisName: "Time"
          ),
          SplineSeries<SalesData, String>(
              // Bind data source
              color: Colors.white,
              dataSource: <SalesData>[
                SalesData('8', 1),
                SalesData('10', 2),
                SalesData('12', 30),
                SalesData('14', 39),
                SalesData('16', 40),
                SalesData('18', 2),
                SalesData('20', 0),
                SalesData('22', 39),
                SalesData('24', 40)
              ],
              xValueMapper: (SalesData sales, _) => sales.time,
              yValueMapper: (SalesData sales, _) => sales.sales),
        ]);
  }
}

class TopCard extends StatelessWidget {
  const TopCard({Key key, @required this.screenHeight, this.text1, this.text2})
      : super(key: key);

  final double screenHeight;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.black),
        height: 0.15 * screenHeight,
        child: Column(
          children: <Widget>[
            SizedBox(height: 15.0),
            Text(
              text1,
              style: TextStyle(fontSize: 15.0, color: Colors.white),
            ),
            SizedBox(height: 0.04 * screenHeight),
            Text(
              text2,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SalesData {
  SalesData(this.time, this.sales);
  final String time;
  final double sales;
}
