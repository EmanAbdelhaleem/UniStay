import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: SignUpPage(),
      ),
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  String _fullName = '';
  String _phoneNumber = '';
  String _email = '';
  String _password = '';
  bool _agreedToTerms = false;
  bool _showPassword = false;

  PhoneNumber _internationalPhoneNumber = PhoneNumber(isoCode: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.0),
              _buildWelcomeText(),
              SizedBox(height: 10.0),
              _buildLogoImage(),
              SizedBox(height: 20.0),
              _buildCreateAccountText(),
              SizedBox(height: 20.0),
              _buildForm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeText() {
    return Text(
      'Welcome to',
      style: GoogleFonts.poppins(
          textStyle: TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.w500,
      )),
    );
  }

  Widget _buildLogoImage() {
    return Image.asset('assets/image7.png');
  }

  Widget _buildCreateAccountText() {
    return Text(
      'Create an account with easy and fast methods',
      style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey[700])),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          inputField(
              label: "Full Name",
              textField: _buildFullNameField("Eman Abdehaleem")),
          SizedBox(height: 10.0),
          _buildPhoneNumberField("Phone number"),
          SizedBox(height: 10.0),
          inputField(
              label: "Email",
              textField: _buildEmailField("emanabdelhaleem@gmail.com")),
          SizedBox(height: 10.0),
          inputField(
              label: "Password",
              textField: _buildPasswordTextField("enter your password")),
          SizedBox(height: 5.0),
          _buildTermsCheckbox(),
          SizedBox(height: 20.0),
          _BuildSignUpButton(),
          SizedBox(height: 20.0),
          _buildAlreadyHaveAccountText(),
        ],
      ),
    );
  }

  Widget _buildFullNameField(String hint) {
    return TextFormField(
      decoration: decorateTextFields(hint),
      validator: (value) =>
          value!.isEmpty ? 'Please enter your full name.' : null,
      onSaved: (value) => _fullName = value!,
    );
  }

  Widget _buildPhoneNumberField(String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelTextFields(hint),
        SizedBox(
          height: 5.0,
        ),
        InternationalPhoneNumberInput(
          inputDecoration: decorateTextFields(hint),
          onInputChanged: (PhoneNumber number) =>
              _internationalPhoneNumber = number,
          validator: (value) =>
              value!.isEmpty ? 'Please enter your phone number.' : null,
          onSaved: (PhoneNumber number) => _phoneNumber = number.phoneNumber!,
        ),
        SizedBox(
          height: 10.0,
        )
      ],
    );
  }

  Widget _buildEmailField(String hint) {
    return TextFormField(
      decoration: decorateTextFields(hint),
      validator: (value) {
        if (value!.isEmpty) return 'Please enter your email address.';
        if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z]*@[a-zA-Z0-9]*\.[a-zA-Z]+")
            .hasMatch(value)) return 'Please enter a valid email address.';
        return null;
      },
      onSaved: (value) => _email = value!,
    );
  }

  TextFormField _buildPasswordTextField(String hint) {
    return TextFormField(
      decoration: decorateTextFields(hint),
      validator: (value) {
        if (value!.isEmpty) return 'Please enter your password.';
        if (value.length < 6)
          return 'Password must be at least 6 characters long.';
        return null;
      },
      onSaved: (value) => _password = value!,
      obscureText: !_showPassword,
    );
  }

  Widget _buildTermsCheckbox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          value: _agreedToTerms,
          onChanged: (value) => setState(() => _agreedToTerms = value!),
        ),
        Expanded(
            child: Text(
          'I agree with terms of conditions and privacy policy',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(fontSize: 12, color: Colors.grey)),
        ))
      ],
    );
  }

  Widget _BuildSignUpButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
        }
        Navigator.of(context).pushNamed('login_with_phone');
      },
      child: Text(
        "Sign Up",
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

  Widget _buildAlreadyHaveAccountText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Already have an account?', style: GoogleFonts.poppins()),
        SizedBox(width: 5.0),
        TextButton(
          onPressed: () => Navigator.of(context).pushNamed('login_with_phone'),
          child: Text(
            'Log In',
            style:
                GoogleFonts.poppins(textStyle: TextStyle(color: Colors.blue)),
          ),
        ),
      ],
    );
  }

  Widget labelTextFields(String label) {
    return Text(label,
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black87),
        ));
  }

  InputDecoration decorateTextFields(String hint) {
    return InputDecoration(
        hintText: hint,
        contentPadding: EdgeInsets.symmetric(vertical: 17, horizontal: 10),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff9E9E9E),
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent),
          borderRadius: BorderRadius.circular(10.0),
        ),
        suffixIcon: hint == "enter your password"
            ? IconButton(
                icon: Icon(
                    _showPassword ? Icons.visibility : Icons.visibility_off),
                onPressed: () => setState(() => _showPassword = !_showPassword),
              )
            : null);
  }

  Widget inputField({label, textField}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        labelTextFields(label),
        SizedBox(
          height: 5,
        ),
        textField,
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
