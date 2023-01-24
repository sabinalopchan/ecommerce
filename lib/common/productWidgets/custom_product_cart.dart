import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomProductCart extends StatefulWidget {
  final String title;
  final String subTitle;
  final String image;
  const CustomProductCart({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
  });

  @override
  State<CustomProductCart> createState() => _CustomProductCartState();
}

class _CustomProductCartState extends State<CustomProductCart> {
  int _itemCount = 0;

  void _incrementCounter() {
    setState(() {
      _itemCount++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _itemCount--;
    });
  }

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
            width: 12,
          ),
          Container(
            decoration: BoxDecoration(
                color: Color(0xFFAE1DFFD),
                borderRadius: BorderRadius.circular(12)),
            child: Row(children: [
              IconButton(
                  icon: Icon(Icons.remove, size: 10),
                  onPressed: () {
                    _itemCount != 0 ? _decrementCounter() : Container();
                  }),
              Text(
                _itemCount.toString(),
              ),
              IconButton(
                  icon: Icon(
                    Icons.add,
                    size: 10,
                  ),
                  onPressed: _incrementCounter
                  // onPressed: ()=>setState(()=>_itemCount++),
                  )
            ]),
          )
        ],
      ),
    );
  }
}
