import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/attributes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_1/FavouritePage.dart';

class RegisteredNumbers with ChangeNotifier {
  final List<String> _numbers = []; // Replace with your actual list

  List<String> get numbers => _numbers.toList(); // Return a copy to avoid modification

  void addNumber(String number) {
    _numbers.add(number);
    notifyListeners(); // Notify listeners of change
  }
}


// class ItemCard extends StatefulWidget {
//   final String imagePath;
//   final String title;
//   bool isFavourite;
//
//   ItemCard({
//     required this.imagePath,
//     required this.title,
//     required this.isFavourite,
//   });
//
//   @override
//   _ItemCardState createState() => _ItemCardState();
// }
//
// class _ItemCardState extends State<ItemCard> {
//   @override
//   Widget build(BuildContext context) {
//     double cardHeight = SP().screen_height / 4;
//
//     return Container(
//       width: SP().screen_width / 2 - appSizes.calcW(20),
//       height: cardHeight,
//       margin: EdgeInsets.all(8.0),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20.0),
//         color: Color(appColors.likeWhite),
//       ),
//       child: Padding(
//         padding: EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             Stack(
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(20.0),
//                   child: Padding(
//                     padding: const EdgeInsets.only(
//                         bottom: 4.0), // Add padding to the bottom
//                     child: Image.asset(
//                       widget.imagePath,
//                       width: double.infinity,
//                       height: cardHeight * 0.7,
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   top: appSizes.calcH(10.0),
//                   right: appSizes.calcW(10.0),
//                   child: CircleAvatar(
//                     backgroundColor: Colors.white,
//                     child: IconButton(
//                       icon: Icon(
//                         widget.isFavourite
//                             ? Icons.favorite
//                             : Icons.favorite_border,
//                         color: Colors.pinkAccent,
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           widget.isFavourite = !widget.isFavourite;
//                         });
//                       },
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   bottom: appSizes.calcH(10.0),
//                   right: appSizes.calcW(10.0),
//                   child: TextButton(
//                     onPressed: () {},
//                     child: Text('Rent'),
//                     style: TextButton.styleFrom(
//                       backgroundColor: Color(appColors.smallButtons),
//                       foregroundColor: Colors.white,
//                       padding: EdgeInsets.symmetric(horizontal: 10.0),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: appSizes.calcH(5.0)),
//             Text(
//               widget.title,
//               style: GoogleFonts.poppins(
//                 textStyle: TextStyle(
//                   fontSize: 15,
//                 ),
//               ),
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// item_list_provider.dart

// class ItemListProvider extends ChangeNotifier {
//   final List<ItemCard> _items = [];
//
//   List<ItemCard> get items => _items;
//
//   void addItem(ItemCard item) {
//     _items.add(item);
//     notifyListeners(); // Notify listeners that the list has changed
//   }
//
//   void removeItem(ItemCard item) {
//     _items.remove(item);
//     notifyListeners();
//   }
// }



