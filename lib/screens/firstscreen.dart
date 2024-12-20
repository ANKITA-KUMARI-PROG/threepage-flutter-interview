import 'package:flutter/material.dart';
import 'package:interviewques/screens/secondscreen.dart';

class Firstscreen extends StatefulWidget {
  const Firstscreen({super.key});

  @override
  State<Firstscreen> createState() => _FirstscreenState();
}

class _FirstscreenState extends State<Firstscreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
         scrollDirection: Axis.vertical,
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 400,
                height: 455,
                child: Image.asset('asset/manage_project.png',),
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                "Manage Your\n  Project",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: size.height * 0.05,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                'Keep your business organized in just\n one application',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: size.height * 0.02,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: size.height * 0.05),
              SizedBox(
                height: size.height * 0.07,
                width: size.width * 0.6,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Secondscreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(239, 72, 54, 43),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(size.width * 0.8),
                    ),
                  ),
                  child: Text(
                    "Let's Start",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.height * 0.025,
                    ),
                  ),
                ),
              ),
            ],
          ),
      )
    );
  }
}
