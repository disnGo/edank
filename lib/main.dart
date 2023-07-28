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
  runApp(const MyApp());
}

class BarChartData {
  final String month;
  final int income;
  final int outcome;

  BarChartData({required this.month, required this.income, required this.outcome});
}

class PieChartData{
  final String category;
  final int value;

  PieChartData({required this.category, required this.value});
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
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  HomeScreenState createState() => HomeScreenState();

}

class HomeScreenState extends State<HomeScreen> {
  final List<PieChartData> pieData = [
    PieChartData(
      category: 'Food',
      value: 25,
    ),
    PieChartData(
      category: 'Transport',
      value: 15,
    ),
    PieChartData(
      category: 'Rent',
      value: 35,
    ),
    PieChartData(
      category: 'Shopping',
      value: 10,
    ),
    PieChartData(
      category: 'Others',
      value: 15,
    ),
];


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

  bool _isBarChart = true;

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
              'Saturday, 29th of July',
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
                '94000,00 ₸',
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
                  label: const Text('Income\n25000,00 ₸'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[300],
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.4, 80),
                    shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.remove),
                  label: const Text('Expense\n11200,00 ₸'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[300],
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.4, 80),
                    shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),

            IconButton( // this is a button widget with an icon
              icon: _isBarChart 
                  ? const Icon(Icons.bar_chart) 
                  : const Icon(Icons.pie_chart), // this is the icon that we want to use
              alignment: Alignment.topLeft,
              iconSize: 32.0,
              onPressed: () {
                setState(() {
                  _isBarChart = !_isBarChart; // this toggles the state variable when the button is pressed
                });
              },
            ),


            _isBarChart // this is a conditional expression that shows or hides the charts based on the state variable
            ? SfCartesianChart( // this is the bar chart widget
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
              )
            : SfCircularChart( // this is the pie chart widget
                series: <CircularSeries>[
                  PieSeries<PieChartData, String>(
                      dataSource: pieData,
                      xValueMapper: (PieChartData data, _) => data.category,
                      yValueMapper: (PieChartData data, _) => data.value,
                      dataLabelSettings: const DataLabelSettings(isVisible: true))
                ],
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
                  Text('Saturday, 29th July', style:
                  TextStyle(fontSize:
                  14, color:
                  Colors.grey[600])),
              trailing:
                  Text('15000,00 ₸', style:
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
                  Text('Friday, 28th July', style:
                  TextStyle(fontSize:
                  14, color:
                  Colors.grey[600])),
              trailing:
                  Text('2800,00 ₸', style:
                  TextStyle(fontSize:
                  18, fontWeight:
                  FontWeight.bold, color: Colors.green[800])),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
