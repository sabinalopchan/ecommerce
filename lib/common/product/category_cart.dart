import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../app/theme.dart';

class CategoryCart extends StatefulWidget {
  final String title;
  const CategoryCart({
    super.key,
    required this.title,
  });

  @override
  State<CategoryCart> createState() => _CategoryCartState();
}

class _CategoryCartState extends State<CategoryCart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: CustomTheme.whitetextColor,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              child: Text(
                widget.title,
                style: TextStyle(color: CustomTheme.lightTextColor),
              )),
        ),
        SizedBox(height: 5),
      ],
    );
  }
}
