import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:interviewques/screens/firstscreen.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final List<String> days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    final List<String> subtasks = ["App Design", "UI/UX", "3D Animation", "Landing Page"];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Dashboard", style: TextStyle(color: Colors.white)),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.notifications, color: Colors.white),
          ),
        ],
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenSize.width * 0.05,
          vertical: screenSize.height * 0.02,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Productivity Overview",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: screenSize.height * 0.03),
              Container(
                height: screenSize.height * 0.35,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: BarChart(
                  BarChartData(backgroundColor: Colors.white,
                  
                    barGroups: [
                      BarChartGroupData(
                        x: 0,
                        barRods: [
                          BarChartRodData(
                            toY: 2,
                            color: const Color.fromARGB(255, 204, 199, 199),
                            width: 25,
                            rodStackItems: [
                              BarChartRodStackItem(0, 1.5, Colors.teal),
                            ],
                          ),
                        ],
                      ),
                      BarChartGroupData(
                        x: 4,
                        barRods: [
                          BarChartRodData(
                            toY: 3,
                            color: const Color.fromARGB(255, 204, 199, 199),
                            width: 25,
                            rodStackItems: [
                              BarChartRodStackItem(0, 2, Colors.teal),
                            ],
                          ),
                        ],
                      ),
                      BarChartGroupData(
                        x: 2,
                        barRods: [
                          BarChartRodData(
                            toY: 4,
                            color: const Color.fromARGB(255, 204, 199, 199),
                            width: 25,
                            rodStackItems: [
                              BarChartRodStackItem(0, 3, Colors.teal),
                            ],
                          ),
                        ],
                      ),
                      BarChartGroupData(
                        x: 8,
                        barRods: [
                          BarChartRodData(
                            toY: 1,
                            color: const Color.fromARGB(255, 204, 199, 199),
                            width: 25,
                            rodStackItems: [
                              BarChartRodStackItem(0, 0.75, Colors.teal),
                            ],
                          ),
                        ],
                      ),
                      BarChartGroupData(
                        x: 8,
                        barRods: [
                          BarChartRodData(
                            toY: 1.5,
                            color: const Color.fromARGB(255, 204, 199, 199),
                            width: 25,
                            rodStackItems: [
                              BarChartRodStackItem(0, 1, Colors.teal),
                            ],
                          ),
                        ],
                      ),
                      BarChartGroupData(
                        x: 8,
                        barRods: [
                          BarChartRodData(
                            toY: 5,
                            color: const Color.fromARGB(255, 204, 199, 199),
                            width: 25,
                            rodStackItems: [
                              BarChartRodStackItem(0, 4, Colors.teal),
                            ],
                          ),
                        ],
                      ),
                      BarChartGroupData(
                        x: 8,
                        barRods: [
                          BarChartRodData(
                            toY: 3.5,
                            color: const Color.fromARGB(255, 204, 199, 199),
                            width: 25,
                            rodStackItems: [
                              BarChartRodStackItem(0, 2.5, Colors.teal),
                            ],
                          ),
                        ],
                        barsSpace: 20,
                      ),
                    ],


                    barTouchData: BarTouchData(enabled: true),
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        axisNameWidget: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: days.map((day) => Text(day)).toList(),
                        ),
                      ),
                      topTitles: AxisTitles(
                        axisNameWidget: const Text(
                          'Overall\n41',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenSize.height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    "Subtasks",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.more_horiz_sharp, color: Colors.black, size: 30),
                ],
              ),
              ListView.builder(
                itemBuilder: (context, index) {
                  return Container( height: 60,
                  width: 50,
                  
                  decoration: BoxDecoration(
                 color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(25)),
                    child: ListTile(
                      title: Text(subtasks[index]),
                      leading: const Icon(
                        Icons.check_circle_sharp,
                        color: Colors.teal,
                        size: 30,
                      ),
                      trailing: const Icon(Icons.person),
                    ),
                  );
                },
                itemCount: subtasks.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
            
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Firstscreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    
                    
                    backgroundColor: const Color.fromARGB(239, 72, 54, 43),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text(
                    "    Add Subtasks    ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16
                    ),
                  ),
                ),
              Icon(Icons.add_circle_outlined, color: const Color.fromARGB(255, 46, 37, 37),
              size: 50,)],
            )],
          ),
        ),
      ),
    );
  }
}
