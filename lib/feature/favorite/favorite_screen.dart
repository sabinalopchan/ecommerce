import 'package:ecommerce/common/product/favorite_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../common/app/theme.dart';

class FavoriteScreen extends StatefulWidget {
  FavoriteScreen({super.key});
  final List<Map<String, dynamic>> _orderList = [
    {
      "title": "Converse",
      "subTitle": "5000",
      "image": "assets/images/shoe.jpg"
    },
    {
      "title": "Converse",
      "subTitle": "5000",
      "image": "assets/images/shoe.jpg"
    },
  ];

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          title: Text(
            "My Favorite",
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
                Positioned(
                    child: CustomScrollView(
                      slivers: [
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 4),
                                child: FavoriteCart(
                                  title: widget._orderList[index]["title"],
                                  subTitle: widget._orderList[index]
                                      ["subTitle"],
                                  image: widget._orderList[index]["image"],
                                ),
                              );
                            },
                            childCount: widget._orderList.length,
                          ),
                        )
                      ],
                    ),
                    top: 30.0,
                    left: 0.0,
                    right: 0.0,
                    bottom: 0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
