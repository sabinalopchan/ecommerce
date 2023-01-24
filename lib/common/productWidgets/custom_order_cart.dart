import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomOrdercart extends StatefulWidget {
  final String title;
  final String subTitle;
  final String image;
  const CustomOrdercart({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
  });

  @override
  State<CustomOrdercart> createState() => _CustomOrdercartState();
}

class _CustomOrdercartState extends State<CustomOrdercart> {
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
            color: Colors.black,
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
              padding: const EdgeInsets.only(top: 12, bottom: 6),
              child: Text(widget.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 3.0),
              child: Text(widget.subTitle,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
            ),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                  color: Color.fromARGB(255, 95, 94, 94),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  child:
                      Text("processing", style: TextStyle(color: Colors.white)),
                ))
          ]),
        ],
      ),
    );
  }
}
