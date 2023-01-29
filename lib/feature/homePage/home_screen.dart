import 'package:flutter/material.dart';

import '../../common/app/theme.dart';
import '../../common/product/category_cart.dart';
import '../../common/product/product_cart.dart';
import '../../common/textfield/custom_textfield.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  final List<Map<String, dynamic>> _products = [
    {
      "title": "Converse",
      "price": "5000",
      "image": "assets/images/shoe.jpg",
    },
    {
      "title": "Converse",
      "price": "5000",
      "image": "assets/images/shoe.jpg",
    },
    {
      "title": "Converse",
      "price": "5000",
      "image": "assets/images/shoe.jpg",
    },
    {
      "title": "Converse",
      "price": "5000",
      "image": "assets/images/shoe.jpg",
    },
    {
      "title": "Converse",
      "price": "5000",
      "image": "assets/images/shoe.jpg",
    },
    {
      "title": "Converse",
      "price": "5000",
      "image": "assets/images/shoe.jpg",
    },
    {
      "title": "Converse",
      "price": "5000",
      "image": "assets/images/shoe.jpg",
    },
  ];

  final List<Map<String, dynamic>> _category = [
    {
      "title": "Shoe",
    },
    {
      "title": "Acessories",
    },
    {
      "title": "Watch",
    },
    {
      "title": "Cloth",
    },
    {
      "title": "Electronics",
    },
    {
      "title": "Shoe",
    },
    {
      "title": "Shoe",
    },
    {
      "title": "Shoe",
    },
  ];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            hintText: "Search",
            suffixIcon: Icon(Icons.search),
          ),
          // Container(
          //     margin: EdgeInsets.symmetric(horizontal: 10),
          //     child: Text(
          //       "Welcome,",
          //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          //     )),
          // Container(
          //     margin: EdgeInsets.symmetric(horizontal: 10),
          //     child: Text(
          //       "Sabina",
          //       // authVM.loggedInUser != null
          //       //     ? authVM.loggedInUser!.name.toString()
          //       //     : "Guest",
          //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          //     )),
          Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(widget._category.length, (index) {
                return CategoryCart(
                  title: widget._category[index]["title"],
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
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 220,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
