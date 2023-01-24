
import 'package:flutter/material.dart';


class CustomListTile extends StatefulWidget {
  final String title;
  final String subTitle;
  final IconData leadingIcon;
  const CustomListTile({super.key,
  required this.title,
  required this.subTitle,
  required this.leadingIcon,
  }
  );

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 8),
      child: Card(
           color: Color.fromARGB(255, 238, 237, 237),
           shape:RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(12)
             ),
           child: Container(
             padding: EdgeInsets.symmetric(horizontal: 8,vertical:14),
             child: Row(
               children: [
                 Icon(
                   widget.leadingIcon,
                   size: 40,
                   color: Colors.blueAccent,
                   ),
                 Expanded(
                   child: Container(
                     padding: EdgeInsets.symmetric(horizontal: 20),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(
                           widget.title,
                           style: TextStyle(
                             fontWeight: FontWeight.bold,
                             fontSize:20,
                           ),
                           ),
                           SizedBox(height: 8,),
                         Text(
                           widget.subTitle,
                          style: TextStyle(
                            color: Colors.grey,
                             fontSize:14,
                           ),
                         )
                       ],
                     ),
                   ),
                 ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 26,
                   color: Colors.blueAccent,
                    ),
               ],
             ),
           ),
         ),
    );
  }
}