import 'package:flutter/material.dart';
import 'package:flutter_application_1/attributes.dart';
import 'package:flutter_application_1/ItemCard.dart';
import 'package:flutter_application_1/profile.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return
      ChangeNotifierProvider<ItemListProvider>(
        create: (context) => ItemListProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: SearchPage()
      ),
    ));
  }
}

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: appSizes.calcH(10)),
                  BuildUpperArea(),
                  BuildTextField(),
                  _buildGridOfItems(),

                ])),
        bottomNavigationBar: BottomAppBar(
          height: appSizes.calcH(70),
          color: const Color(appColors.blueColor),
          child: FooterIcons(
            onCategorySelected: (int) {},
          ),
        ));
  }

  Widget BuildUpperArea() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: appSizes.calcW(250),
          height: appSizes.calcH(70),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(45),
            border: Border.all(color: Colors.blue, width: 2),
          ),
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.location_on, color: Colors.blue),
              SizedBox(width: appSizes.calcW(5)),
              Text(
                ' Mansoura',
                style: TextStyle(color: Colors.grey, fontSize: 22),
              ),
              Icon(Icons.arrow_drop_down, color: Colors.blue),
              SizedBox(width: appSizes.calcW(5)),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(20),
            side: const BorderSide(color: Colors.blue, width: 2),
          ),
          child: const Icon(
            Icons.notifications_active,
            size: 30,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }

  Widget BuildTextField() {
    return Stack(
      children: [
        Column(
          children: <Widget>[
            SizedBox(
              width: appSizes.calcW(500.0),
              height: appSizes.calcH(70.0),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    labelText: 'Search for Your perfect place',
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 18.0,
                      fontFamily: 'Raleway',
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('no_result');
                      },
                      icon: Image.asset('assets/Vector.png'),
                    ),
                    filled: true,
                    fillColor: const Color(0xfff5f4f9),
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Color(0xFF2A7EC1), width: 1.0),
                    ),
                  ),
                ),
              ),
            ),
            const Text(
              ' Suggested For You:',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildGridOfItems() {
    return ItemList(items: TransactedItems);
  }

}
