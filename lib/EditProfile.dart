import 'package:flutter/material.dart';
import 'package:flutter_application_1/attributes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_application_1/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: EditProfilePage(),
      ),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  String _name = 'Ayman Haleem';
  String _email = 'emanabdelhaleem4@gmail.com';
  String? _phoneNumber = '+201188930288';
  String? _facebookLink = 'https://www.facebook.com/eman.abdelhaleem.980';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Edit Profile",
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 22.0,
              color: Colors.black,
            ),
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('profile');
            },
            icon: Icon(
              Icons.arrow_back,
              size: 30,
            )),
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildProfilePhoto(),
          SizedBox(height: appSizes.calcH(20)),
          BuildEditProfileForm(),
        ],
      )),
      bottomNavigationBar: BottomAppBar(
        height: appSizes.calcH(70),
        color: Color(appColors.blueColor),
        child: FooterIcons(
          onCategorySelected: (int) {},
        ),
      ),
    );
  }

  Widget _buildProfilePhoto() {
    return CircleAvatar(
      radius: 60,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 60,
        backgroundImage: AssetImage(
          'assets/profile.jpg',
        ),
      ),
    );
  }

  Widget _buildNameField() {
    return TextFormField(
      decoration: decorateTextFields(
          writtenText: _name, iconType: Icons.person_outline_rounded),
      onSaved: (value) => _name = value!,
    );
  }

  Widget _buildPhoneField() {
    return TextFormField(
      decoration: decorateTextFields(
          writtenText: _phoneNumber, iconType: Icons.phone_outlined),
      onSaved: (value) => _phoneNumber = value,
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      decoration: decorateTextFields(
          writtenText: _email, iconType: Icons.email_outlined),
      validator: (value) {
        if (value == "")
          return null;
        else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z]*@[a-zA-Z0-9]*\.[a-zA-Z]+")
            .hasMatch(value!)) return 'Please enter a valid email address.';
        return null;
      },
      onSaved: (value) => _email = value!,
    );
  }

  Future<void> _launchURL({url}) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }

  Widget _buildFacebookField() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: OutlinedButton.icon(
        onPressed: () => _launchURL(url: _facebookLink),
        icon: Icon(
          Icons.facebook_rounded,
          size: 30,
          color: Color(appColors.blueColor),
        ),
        label: Text(
          'Link',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(fontSize: 20, color: Colors.black)),
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Color(0xfff5f4f9)),
          backgroundColor: Color(0xfff5f4f9),
          minimumSize: Size(200, 70), // Set button size
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  Widget _buildSaveButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
        }
      },
      child: Text("Save",
          style: GoogleFonts.poppins(
            textStyle: TextStyle(color: Colors.white, fontSize: 20),
          )),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(appColors.blueColor),
        minimumSize: Size(200, 60), // Set button size
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget BuildEditProfileForm() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNameField(),
            SizedBox(height: appSizes.calcH(20)),
            _buildPhoneField(),
            SizedBox(height: appSizes.calcH(20)),
            _buildEmailField(),
            SizedBox(height: appSizes.calcH(20)),
            _buildFacebookField(),
            SizedBox(height: appSizes.calcH(20)),
            _buildSaveButton(),
          ],
        ),
      ),
    );
  }

  InputDecoration decorateTextFields({writtenText, iconType}) {
    return InputDecoration(
        hintText: writtenText,
        fillColor: Color(0xfff5f4f9),
        focusColor: Colors.white,
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xfff5f4f9),
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(appColors.blueColor)),
          borderRadius: BorderRadius.circular(20.0),
        ),
        suffixIcon: Icon(
          iconType,
        ));
  }
}
