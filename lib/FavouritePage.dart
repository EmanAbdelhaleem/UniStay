import 'package:flutter/material.dart';
import 'package:flutter_application_1/attributes.dart';
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
        child: FavouritePage(),
      ),
    );
  }
}

class FavouritePage extends StatefulWidget {
  @override
  _FavouritePageState createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  double _screenWidth = 0;
  int _Favourites = items.length;

  @override
  Widget build(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "My Favourite",
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 25.0,
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 40),
            _buildGridTitle(_Favourites, 'estates'),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: _buildGridOfItems(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 70,
        color: Color(appColors.blueColor),
        child: FooterIcons(
          onCategorySelected: (int) {},
        ),
      ),
    );
  }

  Widget _buildGridTitle(int number, String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
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

class ItemCard extends StatefulWidget {
  final String imagePath;
  final String title;
  bool isFavourite;
  int price;

  ItemCard({
    required this.imagePath,
    required this.title,
    required this.isFavourite,
    required this.price,
  });

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    double cardHeight = MediaQuery.of(context).size.height / 4;

    return Container(
      width: MediaQuery.of(context).size.width / 2 - 20,
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
                  top: 10.0,
                  right: 10.0,
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
                  bottom: 10.0,
                  right: 10.0,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(widget.price.toString() + '/day'),
                    style: TextButton.styleFrom(
                      backgroundColor: Color(appColors.smallButtons),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.0),
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
    price: 1300,
  ),
  ItemCard(
    imagePath: 'assets/house2.jpg',
    title: 'Beach House (2 Bedrooms)',
    isFavourite: false,
    price: 5000,
  ),
  ItemCard(
    imagePath: 'assets/house3.jpg',
    title: 'Beach House (2 Bedrooms)',
    isFavourite: false,
    price: 200,
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
