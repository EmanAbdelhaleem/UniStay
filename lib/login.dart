import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: HomePage(),
        )
        );
  }
}

Widget image_part() {
  return Stack(
    children: [
      // Background image
      Stack(
        children: [
          Container(
              width: double.infinity, // Ensures full width
              height: 500,
              child: Image.asset(
                'assets/image8.png', // Replace with your image path
                fit: BoxFit.cover, // Maintains aspect ratio while covering
              )),
          Container(
            width: double.infinity, // Ensures full width
            height: 500,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(.4), // Blue color with 30% opacity
            ),
          )
        ],
      ),
      // Foreground image with positioning
      Positioned(
        top: 100,
        left: 130,
        child: Image.asset(
          'assets/logo1.png',
        ),
      ),

      Positioned(
        top: 110,
        child: Container(
          width: 420,
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Now, You can find a perfect place',
                textAlign: TextAlign.center, // Center the text horizontally
                style: TextStyle(
                    color: Colors.white.withOpacity(0.8), fontSize: 20),
              ),
              Text(
                'with zero effort',
                textAlign: TextAlign.center, // Center the text horizontally
                style: TextStyle(
                    color: Colors.white.withOpacity(0.8), fontSize: 20),
              )
            ],
          ),
        ),
      ),
      Container(
        color: Colors.white.withOpacity(0.0),
      )
    ],
  );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      image_part(),
      Positioned.fill(
        top: 400,
        bottom: 0.0,
        left: 0.0,
        right: 0.0,
        child: Container(
          height: 500,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60), topRight: Radius.circular(60))),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsetsDirectional.all(10),
              child: Column(
                children: [
                  SizedBox(height: 50),
                  LoginButton(
                    icon: Icons.mobile_friendly,
                    text: 'login with mobile number',
                    back_color: 0xFF000000,
                    font_color: 0xFFFFFFFF,
                  ),
                  SizedBox(height: 40),
                  LoginButton(
                    icon: Icons.mail_outline_outlined,
                    text: 'login with Google',
                    back_color: 0xFFFFFFFF,
                    font_color: 0xFF000000,
                  ),
                  SizedBox(height: 40),
                  LoginButton(
                    icon: Icons.facebook_rounded,
                    text: 'login with Facebook',
                    back_color: 0xFFFFFFFF,
                    font_color: 0xFF000000,
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have and accout?",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SignUpButton()
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ]));
  }
}

class LoginButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final int back_color;
  final int font_color;
  LoginButton(
      {required this.icon,
      required this.text,
      required this.back_color,
      required this.font_color});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {
        text == 'login with mobile number'
            ? Navigator.of(context).pushNamed('login_with_phone')
            : null;
      },
      icon: Icon(
        icon,
        color: Color(0xFF1F70b5),
        size: 30,
      ),
      label: Text(
        text,
        style: TextStyle(
            fontSize: 20,
            //fontWeight: FontWeight.bold,
            color: Color(font_color)),
      ),
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Colors.grey), // Set button border
        backgroundColor: Color(back_color),
        minimumSize: Size(400, 60), // Set button size
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}

class SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pushNamed('signup');
      },
      child: Text(
        'sign up',
        style: TextStyle(color: Color(0xFF1F70b5)),
      ),
      style: TextButton.styleFrom(
        textStyle: TextStyle(color: Colors.blueAccent), // Set text color
        backgroundColor: Colors.white,
        splashFactory: NoSplash.splashFactory,
      ),
    );
  }
}
