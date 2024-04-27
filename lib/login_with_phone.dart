import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_1/attributes.dart';
import 'package:flutter_application_1/signUp.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/ProvidersFile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegisteredNumbers>(
        create: (context) => RegisteredNumbers(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: LoginPage(),
      ),
    ));
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _phoneNumber = '';
  PhoneNumber _internationalPhoneNumber = PhoneNumber(isoCode: '');

  @override
  Widget build(BuildContext context) {
    final registeredNumbers = Provider.of<RegisteredNumbers>(context);
    Widget _BuildLoginButton() {
      return ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
          }

          if (registeredNumbers.numbers.contains(_phoneNumber)) {
            // Login successful (navigate to profile or other page)
            Navigator.of(context).pushNamed('profile');
          } else {
            // Login failed - show error message
            print('Invalid phone number or not registered yet.');
          }

        },
        child: Text(
          "Login",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        style: ElevatedButton.styleFrom(
          side: BorderSide(color: Colors.grey), // Set button border
          backgroundColor: Colors.blueAccent,
          minimumSize: Size(400, 60), // Set button size
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        // Wraps entire body for scrolling
        child: Padding(
          padding: const EdgeInsets.all(20.0), // Adjust padding if needed
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _BuildGobackIcon(),
              SizedBox(height: appSizes.calcH(10.0)),
              _buildLoginWithText(),
              SizedBox(height: appSizes.calcH(10.0)),
              _buildPhoneNumberText(), // Check image size
              SizedBox(height: appSizes.calcH(13.0)),
              _buildCorrectionText(),
              SizedBox(height: appSizes.calcH(13.0)),
              Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildPhoneNumberField("Phone Number"),
                      SizedBox(height: appSizes.calcH(200.0)),
                      _BuildLoginButton()
                    ],
                  )),
            ],
          ),
        ),
      ),
    );


  }

  Widget _BuildGobackIcon() {
    return IconButton(
        onPressed: () {
          Navigator.of(context).pushNamed('login');
        },
        icon: Icon(
          Icons.arrow_back,
          size: 30,
        ));
  }

  Widget _buildLoginWithText() {
    return Text(
      'Login With',
      style: GoogleFonts.poppins(
          textStyle: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.w600,
      )),
    );
  }

  Widget _buildPhoneNumberText() {
    return Text(
      'phone number',
      style: GoogleFonts.poppins(
          textStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 21.0,
      )),
    );
  }

  Widget _buildCorrectionText() {
    return Text(
      'Write your phone number correctly',
      style: GoogleFonts.poppins(
          textStyle: TextStyle(color: Color(0xff9E9E9E), fontSize: 13.0)),
    );
  }

  Widget _buildPhoneNumberField(String hint) {
    return InternationalPhoneNumberInput(
      inputDecoration: decorateTextFields(hint),
      onInputChanged: (PhoneNumber number) =>
          _internationalPhoneNumber = number,
      validator: (value) =>
          value!.isEmpty ? 'Please enter your phone number.' : null,
      onSaved: (PhoneNumber number) => _phoneNumber = number.phoneNumber!,
    );
  }



  InputDecoration decorateTextFields(String hint) {
    return InputDecoration(
      hintText: hint,
      contentPadding: EdgeInsets.symmetric(vertical: 17, horizontal: 10),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff9E9E9E),
          ),
          borderRadius: BorderRadius.circular(10.0)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent),
          borderRadius: BorderRadius.circular(10.0)),
    );
  }
}
