import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/app/theme.dart';
import '../../common/product/favorite_cart.dart';
import '../../models/product_model.dart';
import '../../viewmodels/auth_viewmodel.dart';
import '../../viewmodels/global_ui_viewmodel.dart';

class MyProductScreen extends StatefulWidget {
  const MyProductScreen({Key? key}) : super(key: key);

  @override
  State<MyProductScreen> createState() => _MyProductScreenState();
}

class _MyProductScreenState extends State<MyProductScreen> {
  late GlobalUIViewModel _ui;
  late AuthViewModel _authViewModel;

  @override
  void initState() {
    _ui = Provider.of<GlobalUIViewModel>(context, listen: false);
    _authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    getInit();
    super.initState();
  }

  Future<void> getInit() async {
    _ui.loadState(true);
    setState(() async {
      try {
        await _authViewModel.getMyProducts();
      } catch (e) {
        print(e);
      }
    });
    _ui.loadState(false);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(builder: (context, authVM, child) {
      return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          label: Text("Add Product"),
          icon: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).pushNamed("/add-product");
          },
        ),
        appBar: AppBar(
          backgroundColor: CustomTheme.primaryColor,
          title: Text("My Products"),
        ),
        body: RefreshIndicator(
          onRefresh: getInit,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                if (_authViewModel.myProduct != null &&
                    _authViewModel.myProduct!.isEmpty)
                  Center(child: Text("You can add your products here")),
                if (_authViewModel.myProduct != null)
                  ...authVM.myProduct!.map((e) => ProductWidgetList(context, e))
              ],
            ),
          ),
        ),
      );
    });
  }

  InkWell ProductWidgetList(BuildContext context, ProductModel e) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed("/single-product", arguments: e.id);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Card(
          elevation: 5,
          child: ListTile(
            leading: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  e.imageUrl.toString(),
                  height: 300,
                  width: 100,
                  fit: BoxFit.cover,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return Image.asset(
                      'assets/images/logo.png',
                      height: 300,
                      width: 100,
                      fit: BoxFit.cover,
                    );
                  },
                )),
            title: Text(e.productName.toString()),
            subtitle: Text(e.productPrice.toString()),
            trailing: Wrap(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed("/edit-product", arguments: e.id);
                  },
                  icon: Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () {
                    deleteProduct(e.id.toString());
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Product removed successfully")));
                  },
                  icon: Icon(Icons.delete),
                ),
              ],
            ),
          ),
        ),
      ),
      // child: Container(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.end,
      //     children: [
      //       // SizedBox(
      //       //   height: 20,
      //       // ),
      //       Stack(
      //         clipBehavior: Clip.none,
      //         children: [
      //           Container(
      //             height: 580,
      //             // height: _height,
      //             decoration: BoxDecoration(
      //                 color: CustomTheme.backgroudColor,
      //                 borderRadius: BorderRadius.only(
      //                   topLeft: Radius.circular(40),
      //                   topRight: Radius.circular(40),
      //                 )),
      //           ),
      //           Positioned(
      //               child: CustomScrollView(
      //                 slivers: [
      //                   SliverList(
      //                     delegate: SliverChildBuilderDelegate(
      //                       (context, index) {
      //                         return Padding(
      //                           padding: const EdgeInsets.symmetric(
      //                               horizontal: 20, vertical: 4),
      //                           child: FavoriteCart(
      //                             title: e.productName.toString(),
      //                             subTitle: e.productPrice.toString(),
      //                             image: e.imageUrl.toString(),
      //                           ),
      //                         );
      //                       },
      //                       // childCount: widget.e.length,
      //                     ),
      //                   )
      //                 ],
      //               ),
      //               top: 30.0,
      //               left: 0.0,
      //               right: 0.0,
      //               bottom: 0),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

  Future<void> deleteProduct(String id) async {
    var response = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Delete product?'),
            content: Text('Are you sure you want to delete this product?'),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Close')),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  deleteFunction(id);
                },
                child: Text('Delete'),
              )
            ],
          );
        });
  }

  deleteFunction(String id) async {
    _ui.loadState(true);
    try {
      await _authViewModel.deleteMyProduct(id);
    } catch (e) {
      print(e);
    }
    _ui.loadState(false);
  }
}
