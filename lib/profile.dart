import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/attributes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: ProfilePage(),
      ),
    );
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

  int _nTransactions = items.length;

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
              Navigator.of(context).pop();
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
    return ItemList(items: items);
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
          else
            ;
        },
        icon: Icon(icon,
            color: _selectedIndex == index ? Colors.white : Colors.grey[400],
            size: 39));
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

class ItemCard extends StatefulWidget {
  final String imagePath;
  final String title;
  bool isFavourite;

  ItemCard({
    required this.imagePath,
    required this.title,
    required this.isFavourite,
  });

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    double cardHeight = SP().screen_height / 4;

    return Container(
      width: SP().screen_width / 2 - appSizes.calcW(20),
      height: cardHeight,
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Color(appColors.likeWhite),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 4.0), // Add padding to the bottom
                    child: Image.asset(
                      widget.imagePath,
                      width: double.infinity,
                      height: cardHeight * 0.7,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  top: appSizes.calcH(10.0),
                  right: appSizes.calcW(10.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: Icon(
                        widget.isFavourite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.pinkAccent,
                      ),
                      onPressed: () {
                        setState(() {
                          widget.isFavourite = !widget.isFavourite;
                        });
                      },
                    ),
                  ),
                ),
                Positioned(
                  bottom: appSizes.calcH(10.0),
                  right: appSizes.calcW(10.0),
                  child: TextButton(
                    onPressed: () {},
                    child: Text('Rent'),
                    style: TextButton.styleFrom(
                      backgroundColor: Color(appColors.smallButtons),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: appSizes.calcH(5.0)),
            Text(
              widget.title,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 15,
                ),
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

List<ItemCard> items = [
  ItemCard(
    imagePath: 'assets/house1.jpg',
    title: 'Beach House (2 Bedrooms)',
    isFavourite: true,
  ),
  ItemCard(
    imagePath: 'assets/house2.jpg',
    title: 'Beach House (2 Bedrooms)',
    isFavourite: false,
  ),
  ItemCard(
    imagePath: 'assets/house3.jpg',
    title: 'Beach House (2 Bedrooms)',
    isFavourite: false,
  ),
];

class ItemList extends StatelessWidget {
  final List<ItemCard> items;

  const ItemList({required this.items});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: 0.7,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
      children: items,
    );
  }
}
