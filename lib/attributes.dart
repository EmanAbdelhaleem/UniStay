import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class appColors {

  //Colors
  static const blueColor = 0xFF1F70b5;
  static const smallButtons = 0xff214c63;
  static const likeWhite = 0xfff5f4f9;

}

class appSizes{

  //My screen coordinates
  static const devScreenHeight = 843.4285714285714;
  static const devScreenWidth = 411.42857142857144;

  static double calcH(double attribute){
    return attribute/appSizes.devScreenHeight*SP().screen_height;
  }

  static double calcW(double attribute){
    return attribute/appSizes.devScreenWidth*SP().screen_width;
  }

}



/*void main(){
  runApp(ٍSP());
}*/

class SP extends StatelessWidget{

  double screen_width = 411.42857142857144;
  double screen_height = 843.4285714285714;

  @override
  Widget build(BuildContext context) {
    screen_width = MediaQuery.of(context).size.width;
    screen_height = MediaQuery.of(context).size.height;

    return Container(
    );
  }

}
