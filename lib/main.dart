import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => FirstScreen(),
      '/second': (context) => SecondScreen(),
    },
  ));
}

Widget buildPage(String imagePath, String title, String subtitle,
    {bool isLastPage = false}) {
  return Stack(
    children: <Widget>[
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(2.0),
              child: Image.asset(imagePath),
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black.withOpacity(0.5)),
            ),
            if (isLastPage) ...[
              Padding(
                  padding: EdgeInsets.only(top: 50.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.0), // Add padding here
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Log in',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0), // Add padding here
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Sign up',
                            style: TextStyle(color: Colors.blue),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(color: Colors.blue),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ],
        ),
      ),
      Positioned(
        top: 20.0,
        right: 20.0,
        child: FloatingActionButton.extended(
          onPressed: () {},
          label: Text('Skip'),
          backgroundColor: Colors.transparent,
          elevation: 0,
          highlightElevation: 0,
          hoverElevation: 0,
        ),
      ),
    ],
  );
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/second');
    });
    return Scaffold(
      body: Center(
          child: Container(
        color: Colors.white,
        child: Image.asset('assets/image7.png'),
      )),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                children: [
                  buildPage(
                      'assets/image5.png',
                      'Looking for a university\nstay home?',
                      'Unistay is your perfect choice to\nfind a near place to your university'),
                  buildPage(
                      'assets/2223.png',
                      'Lots of choices you can\nsearch in',
                      'You can search using gender,\nspace, loc and budget'),
                  buildPage(
                    'assets/2224.png',
                    'Find the best palce suits\nYour requirments',
                    'Now you can find a perfect place\nwith zero effort.',
                    isLastPage: true,
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: 3, // Number of pages
                  effect: ExpandingDotsEffect(),
                )),
          ],
        ),
      ),
    );
  }
}
