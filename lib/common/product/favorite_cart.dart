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
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Container(
            // color: Colors.black,
            color: Colors.red,
            child: Image.asset(
              widget.image,
              height: 80,
              width: 80,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            width: 40,
          ),
          Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 10),
              child: Text(widget.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
            ),
            Text(widget.subTitle,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400))
          ]),
          SizedBox(
            width: 50,
          ),
          Icon(Icons.delete, size: 20, color: Colors.black)
        ],
      ),
    );
  }
}
