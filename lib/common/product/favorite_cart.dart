import 'package:ecommerce/common/app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FavoriteCart extends StatefulWidget {
  final String title;
  final String subTitle;
  final String image;
  const FavoriteCart({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
  });

  @override
  State<FavoriteCart> createState() => _FavoriteCartState();
}

class _FavoriteCartState extends State<FavoriteCart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Container(
              child: Image.network(
            widget.image,
            height: 60,
            width: 60,
            fit: BoxFit.fill,
            errorBuilder: (BuildContext context, Object exception,
                StackTrace? stackTrace) {
              return Image.asset(
                'assets/images/logo.png',
                height: 60,
                width: 60,
                // fit: BoxFit.cover,
              );
            },
          )),
          SizedBox(
            width: 40,
          ),
          Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 26, bottom: 6),
              child: Text(widget.title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Text(widget.subTitle,
                  style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 16,
                      fontWeight: FontWeight.w400)),
            )
          ]),
          SizedBox(
            width: 70,
          ),
          Icon(Icons.delete, size: 25, color: CustomTheme.lightTextColor)
        ],
      ),
    );
  }
}
