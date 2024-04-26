// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, duplicate_ignore, unnecessary_import
import 'package:flutter_application_1/attributes.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});
  double screen_width = 0;
  double needed_width = 0;
  double screen_height = 0;
  double half_height = 0;
  double needed_height = 0;
  @override
  Widget build(BuildContext context) {
    screen_width = MediaQuery.of(context).size.width;
    needed_width = (screen_width / 3) * 2;
    screen_height = MediaQuery.of(context).size.height;
    half_height = screen_height / 2;
    needed_height = half_height / 3 * 2;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      'assets/image.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 10.0,
                    left: 10.0,
                    child: BackButton(
                      color: Colors.black,
                      onPressed: () {},
                    ),
                  ),
                  Positioned(
                    left: needed_width - 20,
                    top: 20.0,
                    child: IconButton(
                      icon: Image.asset(
                        'assets/Filter.png',
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Positioned(
                    left: needed_width + 30,
                    top: 10.0,
                    child: IconButton(
                      icon: Image.asset('assets/Favorite - Active - Big.png'),
                      onPressed: () {},
                    ),
                  ),
                  Positioned(
                    top: needed_height,
                    left: needed_width + 48,
                    child: IconButton(
                      icon: Image.asset('assets/Gallery - Small.png'),
                      onPressed: () {},
                    ),
                  ),
                  Positioned(
                    top: needed_height + 70,
                    left: needed_width + 48,
                    child: IconButton(
                      icon: Image.asset('assets/Gallery - Small2.png'),
                      onPressed: () {},
                    ),
                  ),
                  Positioned(
                    top: needed_height + 140,
                    left: needed_width + 48,
                    child: IconButton(
                      icon: Image.asset('assets/Gallery - Small - Counter.png'),
                      onPressed: () {},
                    ),
                  ),
                  Positioned(
                    top: half_height + 15,
                    left: 20.0,
                    child: IconButton(
                      icon: Image.asset('assets/Star - Tag.png'),
                      onPressed: () {},
                    ),
                  ),
                  Positioned(
                    top: half_height + 15,
                    left: 125.0,
                    child: IconButton(
                      icon: Image.asset('assets/Category - Wide.png'),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
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
                    padding: EdgeInsets.only(right: 10.0),
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
              ),
              SizedBox(
                height: 10.0,
              ),
              SizedBox(
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
              ),
              Divider(
                color: Colors.grey[200],
                thickness: 1.0,
              ),
              SizedBox(height: 10.0),
              Container(
                //padding: EdgeInsets.all(30.0),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFF25B4F8),
                    ),
                    borderRadius: BorderRadius.circular(18.0)),
                width: screen_width*9/10,
                height: 85.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(left: 20.0)),
                    Image.asset('assets/Ellipse.png'),
                    SizedBox(
                      width: 40.0,
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
                      padding: EdgeInsets.only(right: 20.0),
                      child: IconButton(
                        icon: Image.asset('assets/Chat.png'),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(40.0),
                child: Row(
                  children: <Widget>[
                    Image.asset('assets/mdi_bed-empty.png'),
                    SizedBox(
                      width: 10.0,
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
                      width: 100.0,
                    ),
                    Image.asset('assets/cil_bathroom.png'),
                    SizedBox(
                      width: 10.0,
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
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Location & Public Facilities',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 21.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(25.0),
                child: Row(
                  children: <Widget>[
                    Image.asset('assets/iconoir_pin-alt.png'),
                    SizedBox(
                      width: 30.0,
                    ),
                    Text(
                      'Cairo, Egypt',
                      style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 16.0,
                          color: Colors.grey),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 70.0,
                    width: screen_width*9/10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      border: Border.all(
                        color: Color.fromRGBO(37, 180, 248, 1),
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Image.asset('assets/iconoir_pin-alt2.png'),
                        ),
                        SizedBox(
                          width: 30.0,
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
                          padding: EdgeInsets.only(right: 15.0),
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
                      height: 50.0,
                      width: screen_width/4+10,
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
                      height: 50.0,
                      width: screen_width/4+30,
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
                      height: 50.0,
                      width: screen_width/4+10,
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
                  width: MediaQuery.of(context).size.width,
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
                width: screen_width*9/10,
                height: 85.0,
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
                  height: 63.0,
                  width: screen_width*7/10,
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
              SizedBox(height: 20,),
            ],

          ),

        ),
        bottomNavigationBar: BottomAppBar(
          height: 70,
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
}

class FooterIcons extends StatefulWidget {
  final Function(int) onCategorySelected;
  // ignore: use_key_in_widget_constructors
  const FooterIcons({required this.onCategorySelected});

  @override
  // ignore: library_private_types_in_public_api
  _FooterIconsState createState() => _FooterIconsState();
}

class _FooterIconsState extends State<FooterIcons> {
  int _selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FooterIcon(0, icon: Icons.home),
        FooterIcon(1, icon: Icons.favorite),
        FooterIcon(2, icon: Icons.search),
        FooterIcon(3, icon: Icons.chat),
        FooterIcon(4, icon: Icons.account_circle),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Widget FooterIcon(int index, {icon}) {
    return IconButton(
        onPressed: () {
          setState(() {
            _selectedIndex = index;
            widget.onCategorySelected(_selectedIndex);
          });
        },
        icon: Icon(icon,
            color: _selectedIndex == index ? Colors.white : Colors.grey[400],
            size: 39));
  }
}
