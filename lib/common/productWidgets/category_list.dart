import 'package:flutter/material.dart';

import '../app/theme.dart';


class CategoryListWidget extends StatefulWidget {
  final String title;
  const CategoryListWidget({super.key,
  required this.title,
  
  } );

  @override
  State<CategoryListWidget> createState() => _CategoryListWidgetState();
}

class _CategoryListWidgetState extends State<CategoryListWidget> {
  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color:CustomTheme.whitetextColor,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20,vertical:6),
            child:Text(
              widget.title,
              style: TextStyle(
                color: CustomTheme.lightTextColor
              ),
              )
          ),
          SizedBox(height: 5),
         
        ],
      );
  }
}