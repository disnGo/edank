import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:sizer/sizer.dart';
// import 'constants.dart';
// import 'pages/home_page.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return Sizer(builder: (context, orientation, deviceType){
//       return MaterialApp(
//         title: 'Expense Manager',
//         theme: ThemeData(
//           scaffoldBackgroundColor: kScaffoldColor,
//           appBarTheme: AppBarTheme(
//             backgroundColor: kPrimaryColor,
//             iconTheme: IconThemeData(
//               size: 23.sp,
//               color: kSecondaryColor,
//             ),
//           ),
//           iconTheme: IconThemeData(
//             size: 23.sp,
//             color: kSecondaryColor,
//           ),
//         ),
//         home: const HomePage(),
//       );
//     });
//   }
// }


void main() {
  runApp(MyApp());
}

class BarChartData {
  final String month;
  final int income;
  final int outcome;

  BarChartData({required this.month, required this.income, required this.outcome});
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  
  final List<BarChartData> data = [
      BarChartData(
        month: 'May',
        income: 12000,
        outcome: 8000,
      ),
      BarChartData(
        month: 'June',
        income: 14000,
        outcome: 10000,
      ),
      BarChartData(
        month: 'July',
        income: 16000,
        outcome: 12000,
      ),
      BarChartData(
        month: 'August',
        income: 18000,
        outcome: 14000,
      ),
      BarChartData(
        month: 'September',
        income: 20000,
        outcome: 16000,
      ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Friday, 29th of July',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Hi, Qasymjomart',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                '94000.0',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[800],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text('Income\n25000'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green[300],
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.4, 80),
                    shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.remove),
                  label: const Text('Expense\n11200'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red[300],
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.4, 80),
                    shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              primaryYAxis: NumericAxis(),
              series: <ChartSeries>[
                ColumnSeries<BarChartData, String>(
                    name: 'Income',
                    dataSource: data,
                    xValueMapper: (BarChartData sales, _) => sales.month,
                    yValueMapper: (BarChartData sales, _) => sales.income,
                    color: Colors.green[300]),
                ColumnSeries<BarChartData, String>(
                    name: 'Outcome',
                    dataSource: data,
                    xValueMapper: (BarChartData sales, _) => sales.month,
                    yValueMapper: (BarChartData sales, _) => sales.outcome,
                    color: Colors.red[300])
              ],
              legend: Legend(isVisible: true),
            ),

            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recent Transactions',
                  style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color:
                      Colors.black),
                ),
                TextButton(
                  onPressed: () {},
                  child:
                      const Text('View All', style:
                      TextStyle(fontSize:
                      16, fontWeight:
                      FontWeight.bold, color:
                      Colors.blue)),
                ),
              ],
            ),
            const SizedBox(height:
            8),
            Card(
              shape:
                  RoundedRectangleBorder(borderRadius:
                  BorderRadius.circular(16)),
              elevation:
                  4,
              child:
                  ListTile(
                leading:
                    CircleAvatar(child:
                    Icon(Icons.add, color:
                    Colors.white), backgroundColor:
                    Colors.green[300]),
                title:
                    Text('Income', style:
                    TextStyle(fontSize:
                    18, fontWeight:
                    FontWeight.bold, color:
                    Colors.black)),
                subtitle:
                    Text('Friday, 29th July', style:
                    TextStyle(fontSize:
                    14, color:
                    Colors.grey[600])),
                trailing:
                    Text('15000', style:
                    TextStyle(fontSize:
                    18, fontWeight:
                    FontWeight.bold, color:
                    Colors.green[800])),
              ),
            ),
            Card(
              shape:
                  RoundedRectangleBorder(borderRadius:
                  BorderRadius.circular(16)),
              elevation:
                  4,
              child:
                  ListTile(
                leading:
                    CircleAvatar(child:
                    Icon(Icons.add, color:
                    Colors.white), backgroundColor:
                    Colors.green[300]),
                title:
                    Text('Income', style:
                    TextStyle(fontSize:
                    18, fontWeight:
                    FontWeight.bold, color:
                    Colors.black)),
                subtitle:
                    Text('Friday, 29th July', style:
                    TextStyle(fontSize:
                    14, color:
                    Colors.grey[600])),
                trailing:
                    Text('2800', style:
                    TextStyle(fontSize:
                    18, fontWeight:
                    FontWeight.bold, color:

Colors.green[800])),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
