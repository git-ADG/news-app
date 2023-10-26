import 'package:flutter/material.dart';
import 'package:news_app/pages/home.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    //screen size
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    //size constants
    double imageHeight = height * 0.625;
    double margin = 10.0;
    double elevation = 3.0;
    double radius = 30;
    double buttonWidth = width * 0.75;
    double gap = 20.0;
    double fontSize1 = 26;
    double fontSize2 = 18;
    double padding = 16.0;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: margin, vertical: margin),
            child: Column(
              children: [
                //image
                Material(
                  elevation: elevation,
                  borderRadius: BorderRadius.circular(radius),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(radius),
                    child: Image.asset(
                      "images/building.jpg",
                      width: width,
                      height: imageHeight,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: gap,
                ),
                //main text
                Text(
                  "News from around the\n        globe for you",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize1,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: gap,
                ),
                //secondary text
                Text(
                  "Best time to read, take your time to read\n               a little more of this world",
                  style: TextStyle(
                      color: Colors.white54,
                      fontSize: fontSize2,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: gap,
                ),
                //button
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const Home()));
                  },
                  child: SizedBox(
                    width: buttonWidth,
                    child: Material(
                      borderRadius: BorderRadius.circular(radius),
                      elevation: elevation,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: padding),
                        decoration: BoxDecoration(
                            color: Colors.indigoAccent,
                            borderRadius: BorderRadius.circular(radius)),
                        child: Center(
                          child: Text(
                            "Get Started",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: fontSize2,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
