import 'package:flutter/material.dart';
import 'package:interviewques/screens/thirdscreen.dart';

class Secondscreen extends StatelessWidget {
  const Secondscreen({super.key});

  final List<Map<String, String>> days = const [
    {'day': 'Fri', 'date': '16'},
    {'day': 'Sat', 'date': '17'},
    {'day': 'Sun', 'date': '18'},
    {'day': 'Mon', 'date': '19'},
    {'day': 'Tue', 'date': '20'},
    {'day': 'Wed', 'date': '21'},
  ];

  final List<Map<String, dynamic>> projects = const [
    {
      'color': Colors.teal,
      'icon': Icons.edit_document,
      'count': 18,
      'label': 'In Progress Project',
    },
    {
      'color': Color.fromARGB(255, 98, 56, 105),
      'icon': Icons.note_alt_rounded,
      'count': 42,
      'label': 'Completed Project',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: _buildAppBar(screenWidth, screenHeight),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: ListView(
          children: [
            _buildSearchRow(screenWidth, screenHeight),
            SizedBox(height: screenHeight * 0.02),
            _buildHorizontalList(days, _buildDayItem, screenHeight * 0.12, screenWidth),
            SizedBox(height: screenHeight * 0.02),
            _buildSectionTitle("Project Summary", screenWidth),
            SizedBox(height: screenHeight * 0.02),
            _buildHorizontalList(projects, _buildProjectItem, screenHeight * 0.28, screenWidth),
            SizedBox(height: screenHeight * 0.02),
            _buildSectionHeader(context, "In Progress", "See All", screenWidth),
            SizedBox(height: screenHeight * 0.02),
            _buildInProgressList2(screenWidth, screenHeight),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(double screenWidth, double screenHeight) {
    return AppBar(
      leading: Padding(
        padding: EdgeInsets.only(left: screenWidth * 0.05),
        child: const CircleAvatar(backgroundImage: AssetImage('asset/person.png')),
      ),
      title: RichText(
        text: const TextSpan(
          text: 'Hi Mr. Elon\n',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(
              text: '@mr.elon',
              style: TextStyle(
                fontSize: 11,
                color: Colors.black,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.all(screenWidth * 0.05),
          child: const CircleAvatar(
            backgroundColor: Color.fromARGB(170, 255, 255, 255),
            child: Icon(Icons.notifications, size: 30),
          ),
        ),
      ],
      toolbarHeight: screenHeight * 0.12,
      backgroundColor: Colors.white,
    );
  }

  Widget _buildSearchRow(double screenWidth, double screenHeight) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Find your task...',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(screenWidth * 0.06),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        SizedBox(width: screenWidth * 0.02),
        CircleAvatar(
          backgroundColor: Colors.teal,
          radius: screenWidth * 0.06,
          child: Icon(Icons.search_sharp, size: screenWidth * 0.05, color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildHorizontalList<T>(
    List<T> items,
    Widget Function(T, double) builder,
    double height,
    double screenWidth,
  ) {
    return SizedBox(
      height: height,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: items.map((item) => builder(item, screenWidth)).toList(),
      ),
    );
  }

  Widget _buildDayItem(Map<String, String> day, double screenWidth) {
    return Container(
      width: screenWidth * 0.15,
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(screenWidth * 0.06),
        boxShadow: const [BoxShadow(color: Colors.teal, spreadRadius: 1)],
      ),
      child: Center(
        child: Text(
          "${day['day']}\n${day['date']}",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildProjectItem(Map<String, dynamic> project, double screenWidth) {
    return Container(
      width: screenWidth * 0.5,
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
      decoration: BoxDecoration(
        color: project['color'],
        borderRadius: BorderRadius.circular(screenWidth * 0.06),
      ),
      padding: EdgeInsets.all(screenWidth * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(project['icon'], size: screenWidth * 0.08, color: Colors.white),
          const Spacer(),
          Text(
            '${project['count']}',
            style: TextStyle(
              fontSize: screenWidth * 0.07,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            project['label'],
            style: TextStyle(
              fontSize: screenWidth * 0.05,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, double screenWidth) {
    return Text(
      title,
      style: TextStyle(fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title, String action, double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ThirdScreen()),
            );
          },
          child: Text(
            action,
            style: TextStyle(fontSize: screenWidth * 0.04, color: Colors.teal),
          ),
        ),
      ],
    );
  }

  Widget _buildInProgressList2(double screenWidth, double screenHeight) {
    return Column(
      children: List.generate(2, (index) {
        return Container(
          margin: EdgeInsets.symmetric(
            vertical: screenHeight * 0.01,
            horizontal: screenWidth * 0.04,
          ),
          decoration: BoxDecoration(
            color:  Color.fromARGB(161, 215, 202, 202),
            borderRadius: BorderRadius.circular(35),
            boxShadow: const [
              BoxShadow(
                color: Colors.white,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: ListTile(
            leading: Icon(
              Icons.percent_sharp,
              color: Colors.teal,
              size: screenWidth * 0.06,
            ),
            title: Text(
              'Meta Work Project ${index + 1}',
              style: TextStyle(fontSize: screenWidth * 0.045, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              '18 Oct 2022',
              style: TextStyle(fontSize: screenWidth * 0.03, fontWeight: FontWeight.w300),
            ),
            trailing: Icon(
              Icons.more_vert_outlined,
              color: Colors.black,
              size: screenWidth * 0.05,
            ),
          ),
        );
      }),
    );
  }
}
