import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => FirstScreen(),
    },
  ));
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables
    return Scaffold(
      body: Center(
          child: Container(
        color: Colors.white,
        child: Image.asset('assets/image7.png'),
      )),
    );
  }
}
