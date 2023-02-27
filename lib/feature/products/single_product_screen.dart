import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:ecommerce/viewmodels/auth_viewmodel.dart';
import 'package:ecommerce/viewmodels/global_ui_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/app/theme.dart';
import '../../common/button/custom_button.dart';
import '../../models/favorite_model.dart';
import '../../viewmodels/single_product_viewmodel.dart';

class SingleProductScreen extends StatefulWidget {
  const SingleProductScreen({super.key});

  @override
  State<SingleProductScreen> createState() => _SingleProductScreenState();
}

class _SingleProductScreenState extends State<SingleProductScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SingleProductViewModel>(
        create: (_) => SingleProductViewModel(), child: SingleProduct());
  }
}

class SingleProduct extends StatefulWidget {
  const SingleProduct({super.key});

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {

  late SingleProductViewModel _singleProductViewModel;
  late GlobalUIViewModel _ui;
  late AuthViewModel _authViewModel;
  String? productId;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _singleProductViewModel =
          Provider.of<SingleProductViewModel>(context, listen: false);
      _authViewModel = Provider.of<AuthViewModel>(context, listen: false);
      _ui = Provider.of<GlobalUIViewModel>(context, listen: false);
      final args = ModalRoute.of(context)!.settings.arguments.toString();
      setState(() {
        productId = args;
      });
      print(args);
      getData(args);
    });
    super.initState();
  }

  Future<void> getData(String productId) async {
    _ui.loadState(true);
    try {
      await _authViewModel.getFavoritesUser();
      await _singleProductViewModel.getProducts(productId);
    } catch (e) {}
     _ui.loadState(false);
  }

  Future<void> favoritePressed(
      FavoriteModel? isFavorite, String productId) async {
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
    final _width = MediaQuery.of(context).size.width;

    return Consumer2<SingleProductViewModel, AuthViewModel>(
        builder: (context, singleProductVM, authVm, child) {
        return singleProductVM.product == null
          ? Scaffold(
              body: Container(
                child: Text("Error"),
              ),
            )
          : singleProductVM.product!.id == null
              ? Scaffold(
                  body: Center(
                    child: Container(
                      child: Text("Please wait..."),
                    ),
                  ),
                )
              : Scaffold(
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
                      Builder(builder: (context) {
                        FavoriteModel? isFavorite;
                        try {
                          isFavorite = authVm.favorites.firstWhere(
                              (element) =>
                                  element.productId ==
                                  singleProductVM.product!.id);
                        } catch (e) {}

                        return IconButton(
                            onPressed: () {
                              print(singleProductVM.product!.id!);
                              favoritePressed(
                                  isFavorite, singleProductVM.product!.id!);
                            },
                            icon: Icon(
                              Icons.favorite,
                              color: isFavorite != null
                                  ? CustomTheme.primaryColor
                                  : Colors.white,
                            ));
                      })
                    ],
              // actions: [
              //   Padding(
              //     padding: const EdgeInsets.only(right: 8.0),
              //     child: Icon(
              //       Icons.favorite,
              //       // color: isFavorite != null
              //       //     ? Colors.red
              //       //     : Colors.white,
              //     ),
              //   )
              // ],
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              
              children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    child: Image.network(
                            singleProductVM.product!.imageUrl.toString(),
                            height: 300,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (BuildContext context, Object exception,
                                StackTrace? stackTrace) {
                              return Image.asset(
                                'assets/images/logo.png',
                                height: 300,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              );
                            },
                          ),
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
                            padding:
                                const EdgeInsets.only(top: 30.0, bottom: 15.0),
                            child: Text(
                              singleProductVM.product!.productName
                                      .toString(),
                              style:
                                  TextStyle(color: CustomTheme.lightTextColor),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "Rs. " +
                                      singleProductVM.product!.productPrice
                                          .toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                             
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 15.0, bottom: 15.0),
                            child: Text(
                              "Size: 37,38,39",
                              style:
                                  TextStyle(color: CustomTheme.lightTextColor),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 15.0,
                            ),
                            child: Text(
                              singleProductVM.product!.productDescription
                                      .toString(),
                              style:
                                  TextStyle(color: CustomTheme.lightTextColor),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          CustomButton(
                            title: "Add to cart",
                            onPressed: () {
                              Navigator.of(context).pushNamed('/dashboard');
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ));
      },
    );
  }
}
