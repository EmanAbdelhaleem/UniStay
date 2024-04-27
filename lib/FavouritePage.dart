import 'package:flutter/material.dart';
import 'package:flutter_application_1/attributes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_1/profile.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/ItemCard.dart';

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
        child: FavouritePage(),
      ),
    ));
  }
}

class FavouritePage extends StatefulWidget {
  @override
  _FavouritePageState createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {

  int _Favourites = 0;

  @override
  Widget build(BuildContext context) {

    final itemProvider = Provider.of<ItemListProvider>(context);

    List<ItemCard> favoriteItems = [];

    // Filter items based on isFavourite property
    favoriteItems = itemProvider.items.where((item) => item.isFavourite).toList();
    _Favourites = favoriteItems.length;

    Widget _buildGridOfItems() {
      return favoriteItems.isEmpty
          ? Center(child: Text('No favorites yet!'))
          : GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        children: favoriteItems,
      );
    }

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
            SizedBox(height: appSizes.calcH(40)),
            _buildGridTitle(_Favourites, 'estates'),
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

  Widget _buildGridTitle(int number, String text) {
    return Padding(
      padding:  EdgeInsets.only(left: appSizes.calcW(20.0)),
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


}





