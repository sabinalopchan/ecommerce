import 'package:flutter/material.dart';

import '../app/theme.dart';

class ProductList extends StatefulWidget {
  final String image;
  final String title;
  final String? subTitle;
  final String price;

  const ProductList({
    super.key,
    required this.image,
    required this.title,
    this.subTitle,
    required this.price,
  });

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => ProductDetailsScreen()));
          },
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 20, left: 10, right: 10),
                    child: Image.asset(
                      widget.image,
                      height: 120,
                      width: 130,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    widget.title,
                    style: TextStyle(
                      color: CustomTheme.darkTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  // SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      widget.price,
                      style: TextStyle(
                        color: CustomTheme.darkTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ],
    );
  }
}
