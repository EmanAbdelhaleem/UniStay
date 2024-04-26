import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/profile.dart';
import 'package:flutter_application_1/signUp.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_application_1/attributes.dart';


import 'EditProfile.dart';
import 'FavouritePage.dart';
import 'login_with_phone.dart';

main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'logoScreen',
    routes: {
      'logoScreen': (context) => FirstScreen(),
      'onBoarding': (context) => SecondScreen(),
      'login': (context) => HomePage(),
      'signup': (context) => SignUpPage(),
      'login_with_phone': (context) => LoginPage(),
      'profile' : (context) => ProfilePage(),
      'editProfile' : (context) => EditProfilePage(),
      'favourite' : (context) => FavouritePage(),

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
                  padding: EdgeInsets.only(top: appSizes.calcH(50.0)),
                  child: Row(
                    //crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.0), // Add padding here
                        child: Builder(builder: (context) {
                          return ElevatedButton(
                            onPressed: () =>
                                Navigator.of(context).pushNamed('login'),
                            child: Text(
                              'Log in',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                minimumSize: Size(150, 55)),
                          );
                        }),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0), // Add padding here
                        child: Builder(builder: (context) {
                          return ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('signup');
                            },
                            child: Text(
                              'Sign up',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 20.0),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                                side: BorderSide(color: Colors.blue),
                              ),
                              minimumSize: Size(150, 55),
                            ),
                          );
                        }),
                      ),
                    ],
                  ))
            ],
          ],
        ),
      ),
      if (!isLastPage) ...[
        Positioned(
          top: appSizes.calcH(120.0),
          right: appSizes.calcW(25.0),
          child: Builder(builder: (context) {
            return FloatingActionButton.extended(
              onPressed: () {
                Navigator.of(context).pushNamed('login');
              },
              label: Text('skip',
                  style: TextStyle(fontSize: 20, color: Colors.grey[500])),
              backgroundColor: Colors.transparent,
              elevation: 0,
              highlightElevation: 0,
              hoverElevation: 0,
            );
          }),
        )
      ],
    ],
  );
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, 'onBoarding');
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
                  effect: ExpandingDotsEffect(dotHeight: 7, dotWidth: 11),
                )),
          ],
        ),
      ),
    );
  }
}
