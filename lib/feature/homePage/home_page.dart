import 'package:ecommerce/common/product/product_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../common/app/theme.dart';
import '../../common/product/category_cart.dart';
import '../../common/textfield/custom_textfield.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  final List<Map<String, dynamic>> _categoryList = [
    {
      "title": "Earring",
    },
    {
      "title": "Necklace",
    },
    {
      "title": "Bracelet",
    },
    {
      "title": "Ring",
    },
  ];

  final List<Map<String, dynamic>> _products = [
    // {
    //   "title": "Earring 1",
    //   "price": "5000",
    //   "image": "assets/images/e1.png",
    // },
    // {
    //   "title": "Ring 1",
    //   "price": "6000",
    //   "image": "assets/images/r3.jpg",
    // },
    // {
    //   "title": "Earring 3",
    //   "price": "1200",
    //   "image": "assets/images/e2.png",
    // },
    // {
    //   "title": "Necklace",
    //   "price": "1300",
    //   "image": "assets/images/n3.png",
    // },
    {
      "title": "Ring2",
      "price": "5000",
      "image": "assets/images/logo.png",
    },
  ];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        
        padding: EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              hintText: "Search",
              suffixIcon: Icon(Icons.search),
            ),
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children:
                        List.generate(widget._categoryList.length, (index) {
                  return CategoryCart(
                    title: widget._categoryList[index]["title"],
                  );
                })),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 20, left: 9),
              child: Text(
                "Top Viewed",
                style: TextStyle(
                    color: CustomTheme.darkGray,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Expanded(
              child: CustomScrollView(
                // scrollDirection: Axis.vertical,
                // shrinkWrap: true,
                slivers: [
                  SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return ProductCart(
                          image: widget._products[index]["image"],
                          title: widget._products[index]["title"],
                          price: widget._products[index]["price"],
                        );
                      },
                      childCount: widget._products.length,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      mainAxisExtent: 220,
                    ),
                  ),
                ],
              ),
            )

            // Expanded(
            //   child: GridView.builder(
            //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //      crossAxisCount:2,
            //      crossAxisSpacing: 0,
            //      mainAxisSpacing: 10,
            //      mainAxisExtent: 220,
            //      ),
            //      itemBuilder: (context,index){
            //         return ProductList(
            //                image: widget._products[index]["image"],
            //                title: widget._products[index]["title"],
            //                price: widget._products[index]["price"],
            //                );
            //       },
            //       itemCount: widget._products.length,
            //     ),
            // ),
          ],
        ),
      ),
    );
  }
}
