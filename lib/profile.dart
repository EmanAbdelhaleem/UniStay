import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/attributes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:provider/provider.dart';

import 'ItemCard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ItemListProvider>(
        create: (context) => ItemListProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: ProfilePage(),
      ),
    ));
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _name = 'Ayman Haleem';
  String _imagePath = '';
  String _email = 'emanabdehaleem4@gmail.com';
  int _listings = 0;
  int _sold = 0;
  int _available = 0;

  int _nTransactions = TransactedItems.length;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Profile",
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 25.0,
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).pushNamed('editProfile');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildProfilePhoto(),
            SizedBox(height: appSizes.calcH(20)),
            _buildStatisticRow(),
            SizedBox(height: appSizes.calcH(20)),
            _buildTransListReviews(),
            SizedBox(height: appSizes.calcH(20)),
            _buildGridTitle(_nTransactions, 'Transactions'),
            SizedBox(height: appSizes.calcH(20)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: _buildGridOfItems(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: appSizes.calcH(70),
        color: Color(appColors.blueColor),
        child: FooterIcons(
          onCategorySelected: (int) {},
        ),
      ),
    );
  }

  void _launchEmail(String email) async {
    final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
    );

    if (await canLaunch(_emailLaunchUri.toString())) {
      await launch(_emailLaunchUri.toString());
    } else {
      throw 'Could not launch email app for $email';
    }
  }

  Widget _buildEmailLink({required String email}) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            style: TextStyle(
              color: Colors.grey[400],
            ),
            text: email,
            recognizer: TapGestureRecognizer()
              ..onTap = () => _launchEmail(email),
          )
        ],
      ),
    );
  }

  Widget _buildProfilePhoto() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 70,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage(
                  'assets/profile.jpg',
                ),
              ),
            ),
            Positioned(
              bottom: 1,
              right: 1,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: IconButton(
                    icon: Icon(
                      Icons.create_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Color(appColors.smallButtons),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      50,
                    ),
                  ),
                  color: Color(appColors.smallButtons),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(2, 3),
                      color: Colors.black.withOpacity(
                        0.3,
                      ),
                      blurRadius: 1,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Text(
          _name,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
            ),
          ),
        ),
        _buildEmailLink(email: _email),
      ],
    );
  }

  Widget _buildContainer(int num, String text) {
    return Container(
      width: SP().screen_width / 4,
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade100,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            num.toString(),
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Text(text),
        ],
      ),
    );
  }

  Widget _buildStatisticRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildContainer(_listings, 'Listings'),
        _buildContainer(_sold, 'Sold'),
        _buildContainer(_available, 'Available'),
      ],
    );
  }

  Widget _buildTransListReviews() {
    return ClickableButtonRow(
      onCategorySelected: (int) {},
    );
  }

  Widget _buildGridTitle(int number, String text) {
    return Padding(
      padding: EdgeInsets.only(left: appSizes.calcW(20.0)),
      child: Row(
        children: [
          Text(
            '$number $text',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 25.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridOfItems() {
    // Access the ItemListProvider using Provider
    final itemProvider = Provider.of<ItemListProvider>(context);

    // Ensure the provider has data before building the grid
    if (itemProvider.items.isEmpty) {
      return Center(child: CircularProgressIndicator()); // Show loading indicator
    }

    return GridView.count(
      shrinkWrap: true, // Makes the grid fit its content
      crossAxisCount: 2, // Two items per row
      childAspectRatio: 0.7, // Adjust the aspect ratio as needed
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
      children: itemProvider.items, // Use items from the ItemListProvider
    );
  }


}



class ClickableButtonRow extends StatefulWidget {
  final Function(int) onCategorySelected;

  const ClickableButtonRow({required this.onCategorySelected});

  @override
  _ClickableButtonRowState createState() => _ClickableButtonRowState();
}

class _ClickableButtonRowState extends State<ClickableButtonRow> {
  int _selectedIndex = -1;

  double _rowWidth = 0;

  @override
  Widget build(BuildContext context) {

    _rowWidth = SP().screen_width - appSizes.calcW(20);
    return Container(
      width: _rowWidth,
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(appColors.likeWhite),
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(50.0),
        color: Color(0xfff5f4f9),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildButton(0, 'Transactions'),
          _buildButton(1, 'Listings'),
          _buildButton(2, 'Views'),
        ],
      ),
    );
  }

  Widget _buildButton(int index, String text) {
    return Container(
      width: _rowWidth / 3.5,
      child: TextButton(
        onPressed: () {
          setState(() {
            _selectedIndex = index;
            widget.onCategorySelected(_selectedIndex);
          });
        },
        child: Text(
          text,
          style: TextStyle(
            color: _selectedIndex == index ? Colors.black : Colors.grey[400],
          ),
        ),
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(10.0),
          backgroundColor: _selectedIndex == index
              ? Colors.white
              : Color(appColors.likeWhite),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
      ),
    );
  }
}

class FooterIcons extends StatefulWidget {
  final Function(int) onCategorySelected;
  const FooterIcons({required this.onCategorySelected});

  @override
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

  Widget FooterIcon(int index, {icon}) {
    return IconButton(
        onPressed: () {
          setState(() {
            _selectedIndex = index;
            widget.onCategorySelected(_selectedIndex);
          });

          if (icon == Icons.favorite)
            Navigator.of(context).pushNamed('favourite');
          else if (icon == Icons.account_circle)
            Navigator.of(context).pushNamed('profile');
          else if (icon == Icons.search)
            Navigator.of(context).pushNamed('search');
          else ;
        },
        icon: Icon(icon,
            color: _selectedIndex == index ? Colors.white : Colors.grey[400],
            size: 39));
  }
}