import 'package:ecommerce/common/product/favorite_cart.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/viewmodels/auth_viewmodel.dart';
import 'package:ecommerce/viewmodels/global_ui_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../../common/app/theme.dart';
import '../../models/favorite_model.dart';

class FavoriteScreen extends StatefulWidget {
  FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late GlobalUIViewModel _ui;
  late AuthViewModel _authViewModel;
  String? productId;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _authViewModel = Provider.of<AuthViewModel>(context, listen: false);
      _ui = Provider.of<GlobalUIViewModel>(context, listen: false);
    });
    super.initState();
  }

  Future<void> getInit() async {
    _ui.loadState(true);
    try {
      await _authViewModel.getFavoritesUser();
    } catch (e) {}
    _ui.loadState(false);
  }

  Future<void> removeFavorite(
      FavoriteModel isFavorite, String productId) async {
    _ui.loadState(true);
    try {
      await _authViewModel.favoriteAction(isFavorite, productId);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Favorite updated.")));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Something went wrong. Please try again.")));
      print(e);
    }
    _ui.loadState(false);
  }

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
      body: Consumer<AuthViewModel>(
        builder: (context, authVM, child) {
          return Container(
            child: RefreshIndicator(
              onRefresh: getInit,
              child: authVM.favoriteProduct == null
                  ? Column(
                      children: [
                        Center(child: Text("Something went wrong")),
                      ],
                    )
                  : authVM.favoriteProduct!.length == 0
                      ? Column(
                          children: [
                            Center(child: Text("Please add to favorite")),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
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
                                    child: SingleChildScrollView(
                                      physics: AlwaysScrollableScrollPhysics(),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 24),
                                        child: Column(
                                          children: [
                                            ...authVM.favoriteProduct!
                                                .map((e) => FavoriteCard(e))
                                          ],
                                        ),
                                      ),
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
        },
      ),
    );
  }

  Widget FavoriteCard(ProductModel e) {
    return InkWell(
        onTap: () {
          // print(e.id);
          Navigator.of(context).pushNamed("/single-product", arguments: e.id);
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 4),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              Container(
                  child: Image.network(
                e.imageUrl.toString(),
                height: 60,
                width: 60,
                fit: BoxFit.fill,
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return Image.asset(
                    'assets/images/logo.png',
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  );
                },
              )),
              SizedBox(
                width: 40,
              ),
              Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 26, bottom: 6),
                  child: Text(e.productName.toString(),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Text(e.productPrice.toString(),
                      style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 16,
                          fontWeight: FontWeight.w400)),
                )
              ]),
              SizedBox(
                width: 70,
              ),
              InkWell(
                onTap: (){
                  removeFavorite(_authViewModel.favorites.firstWhere((element) => element.productId == e.id), e.id!);
                },
                child: Icon(
                  Icons.delete,
                  size: 25, color:
                  CustomTheme.lightTextColor
                  )
                  )
            ],
          ),
        ));
  }
}
