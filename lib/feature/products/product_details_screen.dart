import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:ecommerce/feature/products/product_cart_list_screen.dart';

import 'package:flutter/material.dart';

import '../../../../common/app/theme.dart';
import '../../common/button/custom_button.dart';
import '../dashboard/dashboard.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int pageIndex = 0;

  List<Widget> _demo = [
    Container(
      child: Image.asset("assets/images/logo.png"),
    ),
    Container(
      child: Image.asset("assets/images/shoe.jpg"),
    ),
    Container(
      child: Image.asset("assets/images/j.jpg"),
    ),
    Container(
      child: Image.asset("assets/images/shoe.jpg"),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: CustomTheme.backgroudColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back_ios_new, color: Colors.black),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.favorite,
                color: Colors.black,
                size: 25,
              ),
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: PageView(
                children: _demo,
                onPageChanged: (index) {
                  setState(() {
                    pageIndex = index;
                  });
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            CarouselIndicator(
              count: _demo.length,
              index: pageIndex,
            ),
            SizedBox(height: 20),
            Stack(
              children: [
                Container(
                  height: 320,
                  width: _width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0, bottom: 15.0),
                        child: Text(
                          "The Beauty Shop",
                          style: TextStyle(color: CustomTheme.lightTextColor),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Ring 2",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: 150,
                          ),
                          Text(
                            "5000",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 15.0,
                        ),
                        child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                          style: TextStyle(color: CustomTheme.lightTextColor),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      CustomButton(
                        title: "Add to cart",
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProductCartScreen()));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
