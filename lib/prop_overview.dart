import 'dart:html';

import 'package:flutter_application_1/attributes.dart';
import 'package:flutter_application_1/profile.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  double needed_width = 0;
  double half_height = 0;
  double needed_height = 0;
  @override
  Widget build(BuildContext context) {
    needed_width = (SP().screen_width / 3) * 2;
    half_height = SP().screen_height / 2;
    needed_height = half_height / 3 * 2;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _BuildPhotoPart(),
              _BuildLocationtextRow(),
              SizedBox(height: appSizes.calcH(10.0),),
              _BuildRentBuyButtons(),
              Divider(
                color: Colors.grey[200],
                thickness: 1.0,
              ),
              SizedBox(height: appSizes.calcH(10.0)),
              _BuildStateAgentCard(),
              _BuildAttributesRow(),
              Padding(
                padding: EdgeInsets.only(left: appSizes.calcW(20.0)),
                child: BuildText(text: 'Location & Public Facilities', size: 21.0, weight:FontWeight.w700 ),
              ),
              Padding(
                padding: EdgeInsets.all(25.0),
                child: Row(
                  children: <Widget>[
                    Image.asset('assets/iconoir_pin-alt.png'),
                    SizedBox(width: appSizes.calcW(30.0),),
                    BuildText(text: 'Cairo, Egypt', size: 16.0, color: Colors.grey),

                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: appSizes.calcH(70.0),
                    width: SP().screen_width*9/10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      border: Border.all(
                        color: Color.fromRGBO(37, 180, 248, 1),
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: appSizes.calcW(15.0)),
                          child: Image.asset('assets/iconoir_pin-alt2.png'),
                        ),
                        SizedBox(
                          width: appSizes.calcW(30.0),
                        ),
                        Text(
                          '2.5 km',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(37, 43, 92, 1),
                          ),
                        ),
                        Text(
                          ' from your location',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'Raleway',
                              color: Colors.grey),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: appSizes.calcW(15.0)),
                          child: Image.asset(
                              'assets/iconoir_nav-arrow-down.png'),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: Color(appColors.likeWhite),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      padding: EdgeInsets.all(15.0),
                      height: appSizes.calcH(50.0),
                      width: SP().screen_width/4+appSizes.calcW(10),
                      child: Text(
                        '2 Hospitals',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14.0,
                            fontFamily: 'Raleway',
                            color: Color.fromRGBO(83, 88, 122, 1)),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color(appColors.likeWhite),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      padding: EdgeInsets.all(15.0),
                      height: appSizes.calcH(50.0),
                      width: SP().screen_width/4+appSizes.calcW(30),
                      child: Text(
                        '4 Gas stations',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14.0,
                            fontFamily: 'Raleway',
                            color: Color.fromRGBO(83, 88, 122, 1)),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color(appColors.likeWhite),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      padding: EdgeInsets.all(15.0),
                      height: appSizes.calcH(50.0),
                      width: SP().screen_width/4+appSizes.calcW(10),
                      child: Text(
                        '2 Schools',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14.0,
                            fontFamily: 'Raleway',
                            color: Color.fromRGBO(83, 88, 122, 1)),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: SizedBox(
                  width: SP().screen_width,
                  child: Image.asset(
                    'assets/Layout3.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Cost of Living',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(37, 43, 92, 1),
                      ),
                    ),
                    Spacer(),
                    Text(
                      'view details',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(31, 76, 107, 1),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFF25B4F8),
                    ),
                    borderRadius: BorderRadius.circular(18.0)),
                width: SP().screen_width*9/10,
                height: appSizes.calcH(85.0),
                child: Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            '5000',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(37, 43, 92, 1),
                            ),
                          ),
                          Text(
                            '/month*',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(37, 43, 92, 1),
                            ),
                          )
                        ],
                      ),
                      Text(
                        '*From average citizen spend around this location',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 11.0,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(83, 88, 122, 1),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Container(
                  height: appSizes.calcH(63.0),
                  width: SP().screen_width*7/10,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(42, 126, 193, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                    child: Text(
                      'Rent now',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: appSizes.calcH(20),),
            ],

          ),

        ),
        bottomNavigationBar: BottomAppBar(
          height: appSizes.calcH(70),
          // ignore: prefer_const_constructors
          color: Color(0xFF1F70b5),
          child: FooterIcons(
            // ignore: avoid_types_as_parameter_names
            onCategorySelected: (int) {},
          ),
        ),
      ),
    );
  }

  Widget _BuildPhotoPart(){
    return Stack(
      children: <Widget>[
        SizedBox(
          width: SP().screen_width,
          child: Image.asset(
            'assets/image.png',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: appSizes.calcH(10.0),
          left: appSizes.calcW(10.0),
          child: BackButton(
            color: Colors.black,
            onPressed: () {},
          ),
        ),
        Positioned(
          left: needed_width - appSizes.calcW(20),
          top: appSizes.calcH(20.0),
          child: IconButton(
            icon: Image.asset(
              'assets/Filter.png',
            ),
            onPressed: () {},
          ),
        ),
        Positioned(
          left: needed_width + appSizes.calcW(30),
          top: appSizes.calcH(10.0),
          child: IconButton(
            icon: Image.asset('assets/Favorite - Active - Big.png'),
            onPressed: () {},
          ),
        ),
        Positioned(
          top: needed_height,
          left: needed_width + appSizes.calcW(48),
          child: IconButton(
            icon: Image.asset('assets/Gallery - Small.png'),
            onPressed: () {},
          ),
        ),
        Positioned(
          top: needed_height + appSizes.calcH(70),
          left: needed_width + appSizes.calcW(48),
          child: IconButton(
            icon: Image.asset('assets/Gallery - Small2.png'),
            onPressed: () {},
          ),
        ),
        Positioned(
          top: needed_height + appSizes.calcH(140),
          left: needed_width + appSizes.calcW(48),
          child: IconButton(
            icon: Image.asset('assets/Gallery - Small - Counter.png'),
            onPressed: () {},
          ),
        ),
        Positioned(
          top: half_height + appSizes.calcH(15),
          left: appSizes.calcW(20.0),
          child: IconButton(
            icon: Image.asset('assets/Star - Tag.png'),
            onPressed: () {},
          ),
        ),
        Positioned(
          top: half_height + appSizes.calcH(15),
          left: appSizes.calcW(125.0),
          child: IconButton(
            icon: Image.asset('assets/Category - Wide.png'),
            onPressed: () {},
          ),
        )
      ],
    );
  }

  Widget _BuildLocationtextRow(){
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: appSizes.calcW(10.0)),
        ),
        Image.asset('assets/Location.png'),
        Text('Cairo,Egypt',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 12.0,
                color: Colors.grey[600],
              ),
            )),
        Spacer(),
        Padding(
          padding: EdgeInsets.only(right: appSizes.calcW(10.0)),
          child: Text(
              'per month',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey[600],
                ),
              )
          ),
        )
      ],
    );
  }

  Widget _BuildRentBuyButtons(){
    return SizedBox(
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Image.asset('assets/Layout.png'),
            onPressed: () {},
          ),
          IconButton(
              onPressed: () {},
              icon: Image.asset('assets/Layout2.png'))
        ],
      ),
    );
  }

  Widget _BuildStateAgentCard(){
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFF25B4F8),
          ),
          borderRadius: BorderRadius.circular(18.0)),
      width: SP().screen_width*9/10,
      height: appSizes.calcH(85.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(left: appSizes.calcW(20.0))),
          Image.asset('assets/Ellipse.png'),
          SizedBox(
            width: appSizes.calcW(40.0),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Anderson',
                style: TextStyle(
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w700,
                    fontSize: 16.0,
                    color: Color(0xFF252B5C)),
              ),
              Text(
                'Real Estate Agent',
                style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 11.0,
                    color: Color(0xFF53587A)),
              ),
            ],
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(right: appSizes.calcW(20.0)),
            child: IconButton(
              icon: Image.asset('assets/Chat.png'),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }

  Widget _BuildAttributesRow(){
    return Padding(
      padding: EdgeInsets.all(40.0),
      child: Row(
        children: <Widget>[
          Image.asset('assets/mdi_bed-empty.png'),
          SizedBox(
            width: appSizes.calcW(10.0),
          ),
          Text(
            '2 Bedroom',
            style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            width: appSizes.calcW(100.0),
          ),
          Image.asset('assets/cil_bathroom.png'),
          SizedBox(
            width: appSizes.calcW(10.0),
          ),
          Text(
            '1 Bathroom',
            style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }

  Widget BuildText({text, size = 14.0, color = null, weight = FontWeight.normal}){
    return text(
      text,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: weight
        )
      )
    );
  }


}

