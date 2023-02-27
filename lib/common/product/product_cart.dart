// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

// import '../app/theme.dart';

// class ProductCart extends StatefulWidget {
//   final String image;
//   final String title;
//   final String? subTitle;
//   final String price;

//   const ProductCart({
//     super.key,
//     required this.image,
//     required this.title,
//     this.subTitle,
//     required this.price,
//   });
//   @override
//   State<ProductCart> createState() => _ProductCartState();
// }

// class _ProductCartState extends State<ProductCart> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         InkWell(
//           onTap: () {
//             Navigator.of(context).pushNamed('/single_product');
//           },
//           child: Container(
//               decoration: BoxDecoration(
//                   color: Colors.white, borderRadius: BorderRadius.circular(12)),
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(
//                         top: 10, bottom: 20, left: 10, right: 10),
//                     child: Image.asset(
//                       widget.image,
//                       height: 120,
//                       width: 130,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   Text(
//                     widget.title,
//                     style: TextStyle(
//                       color: CustomTheme.darkTextColor,
//                       fontSize: 16,
//                       fontWeight: FontWeight.normal,
//                     ),
//                   ),
//                   // SizedBox(height: 20,),
//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Text(
//                       widget.price,
//                       style: TextStyle(
//                         color: CustomTheme.darkTextColor,
//                         fontSize: 16,
//                         fontWeight: FontWeight.normal,
//                       ),
//                     ),
//                   ),
//                 ],
//               )),
//         ),
//       ],
//     );
//   }
// }
