import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              leading: BackButton(
                onPressed: () {} //empty
                ,
              ),
              title: Text(
                'Search Results',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                    fontFamily: 'Raleway'),
              ),
              actions: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 32.0, left: 286.0),
                  width: 50.0,
                  height: 50.0,
                  child: IconButton(
                    icon: Image.asset(
                      'assets/filter-icon.png',
                      width: 20.0,
                      height: 20.0,
                    ),
                    onPressed: () {
                      //empty
                    },
                  ),
                ),
                IconButton(
                  icon: Image.asset(
                    'assets/filter-icon.png',
                    width: 20.0,
                    height: 20.0,
                  ),
                  onPressed: () {
                    //empty
                  },
                )
              ],
              centerTitle: true,
            ),
            body: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                SizedBox(
                  width: 500.0,
                  height: 70.0,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        labelText: 'London, New York',
                        labelStyle: TextStyle(
                          color: Color(0xFFA1A5C1),
                          fontSize: 12.0,
                          fontFamily: 'Raleway',
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Image.asset('assets/Vector.png')),
                        filled: true,
                        fillColor: Color(0xfff5f4f9),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xFF2A7EC1), width: 1.0),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(left: 14.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Found 0 estates',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: 'Raleway',
                              color: Colors.black,
                            ),
                          ),
                          // SizedBox(width: 5.0),
                          // Text(
                          //   '0',
                          //   style: TextStyle(
                          //     fontSize: 18.0,
                          //     fontFamily: 'Montserrat',
                          //     fontWeight: FontWeight.w700,
                          //     color: Color(0xFF234F68),
                          //   ),
                          // ),
                          // SizedBox(width: 5.0),
                          // Text(
                          //   'estates',
                          //   style: TextStyle(
                          //     fontSize: 18.0,
                          //     fontFamily: 'Raleway',
                          //   ),
                          // ),
                          Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xFF25B4F8),
                                  ),
                                  borderRadius: BorderRadius.circular(100.0)),
                              child: Row(
                                children: <Widget>[
                                  IconButton(
                                      onPressed: () {},
                                      icon: Image.asset('assets/Show.png')),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Image.asset(
                                          'assets/Show - Active.png'))
                                ],
                              ))
                        ],
                      )
                  ),
                  // ignore: prefer_const_literals_to_create_immutables
                ),
              ],
            ),
            backgroundColor: Colors.white,
          ),
          Center(
            child: Container(
              alignment: Alignment.center,
              child: Image.asset('assets/Shape.png'),
            ),
          ),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Image.asset('assets/Shape (1).png'),
                Text(
                  '!',
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 25.0,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                )
              ],
            ),
          ),

          Padding(
              padding: EdgeInsets.only(top: 500.0),
              // ignore: prefer_const_literals_to_create_immutables
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      Text(
                        'Search',
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 25.0,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        'not found',
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 25.0,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w800,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      Text(
                        'Sorry, we can’t find the real estates you are looking for.\nMaybe, a little spelling mistake?',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 14.0,
                            fontFamily: 'Raleway',
                            color: Colors.grey[400],
                          ),
                        )
                      )
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}