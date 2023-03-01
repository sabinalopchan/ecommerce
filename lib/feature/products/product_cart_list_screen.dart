import 'package:flutter/material.dart';

import '../../common/app/theme.dart';
import '../../common/button/custom_button.dart';
import '../../common/product/custom_product_cart.dart';

class ProductCartScreen extends StatefulWidget {
  ProductCartScreen({
    super.key,
  });

  final List<Map<String, dynamic>> _cartList = [
    {
      "title": "Earring 2",
      "subTitle": "5000",
      "image": "assets/images/logo.png"
    },
  ];

  @override
  State<ProductCartScreen> createState() => _ProductCartScreenState();
}

class _ProductCartScreenState extends State<ProductCartScreen> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          title: Text(
            "My Cart",
            style: TextStyle(
              color: Colors.black,
            ),
          )),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // SizedBox(
            //   height: 20,
            // ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 580,
                  // height: _height,
                  decoration: BoxDecoration(
                      color: CustomTheme.backgroudColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      )),
                ),
                // CustomProductCart(title: "title", subTitle: "subTitle", image: "image")
                Positioned(
                    child: CustomScrollView(
                      slivers: [
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 4),
                                child: CustomProductCart(
                                  title: widget._cartList[index]["title"],
                                  subTitle: widget._cartList[index]["subTitle"],
                                  image: widget._cartList[index]["image"],
                                ),
                              );
                            },
                            childCount: widget._cartList.length,
                          ),
                        )
                      ],
                    ),
                    top: 30.0,
                    left: 0.0,
                    right: 0.0,
                    bottom: 60),
                Positioned(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text("Total Cost : Rs: 3000",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500)),
                          ),
                          CustomButton(
                            title: "Checkout",
                          ),
                        ],
                      ),
                    ),
                    top: 480.0,
                    left: 0.0,
                    right: 0.0,
                    bottom: 0.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
