// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../common/app/theme.dart';
// import '../../common/textfield/custom_textfield.dart';
// import '../../models/category_model.dart';
// import '../../models/product_model.dart';
// import '../../services/firebase_service.dart';
// import '../../viewmodels/auth_viewmodel.dart';
// import '../../viewmodels/category_viewmodel.dart';
// import '../../viewmodels/product_viewmodel.dart';

// class HomeScreen extends StatefulWidget {
//   HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   TextEditingController _searchController=new TextEditingController();
  
//   late AuthViewModel _authViewModel = AuthViewModel();
//   late CategoryViewModel _categoryViewModel = CategoryViewModel();
//   late ProductViewModel _productViewModel = ProductViewModel();

//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _authViewModel = Provider.of<AuthViewModel>(context, listen: false);
//       _categoryViewModel =
//           Provider.of<CategoryViewModel>(context, listen: false);
//       _productViewModel = Provider.of<ProductViewModel>(context, listen: false);
//     });
//     refresh();
//     super.initState();
//   }

//   Future<void> refresh() async {
//     _categoryViewModel.getCategories();
//     _productViewModel.getProducts();
//     _authViewModel.getMyProducts();
//   }

//   // void onSearched() async {
//   //   try {
//   //     await FirebaseService.db
//   //         .collection('products')
//   //         .where("productName", isEqualTo: _searchController.text)
//   //         .get()
//   //         .then((value) {
//   //       setState(() {
//   //         products = value.docs.map((doc) => doc.data()).toList();
//   //         productName = _authViewModel.myProduct!.productName.toString();
//   //       });
//   //     });
//   //   } catch (e) {
//   //     print(e);
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     final _width = MediaQuery.of(context).size.width;
//     return Consumer3<CategoryViewModel, AuthViewModel, ProductViewModel>(
//         builder: (context, categoryVM, authVM, productVM, child) {
//       return Container(
//           padding: EdgeInsets.symmetric(horizontal: 14),
//           child: Stack(
//             children: [
//               Positioned.fill(
//                 child: Container(
//                   child: RefreshIndicator(
//                     onRefresh: refresh,
//                     child: SingleChildScrollView(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           CustomTextField(
//                             hintText: "Search",
//                             suffixIcon: Icon(Icons.search),
//                           ),
//                           Container(
//                             child: SingleChildScrollView(
//                               scrollDirection: Axis.horizontal,
//                               child: Row(
//                                 children: [
//                                   ...categoryVM.categories
//                                       .map((e) => CategoryCard(e))
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(
//                                 top: 15, bottom: 20, left: 9),
//                             child: Text(
//                               "Top Viewed",
//                               style: TextStyle(
//                                   color: CustomTheme.darkGray,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w500),
//                             ),
//                           ),
//                           // Container(
//                           //   margin: EdgeInsets.symmetric(horizontal: 10),
//                           //   child: GridView.count(
//                           //     crossAxisSpacing: 10,
//                           //     mainAxisSpacing: 10,
//                           //     childAspectRatio: 0.7,
//                           //     physics: NeverScrollableScrollPhysics(),
//                           //     shrinkWrap: true,
//                           //     crossAxisCount: 2,
//                           //     children: [
//                           //       ...productVM.products.map((e) => ProductCard(e))
//                           //     ],
//                           //   ),
//                           // ),
                          
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ));
//     });
//   }

//   Widget CategoryCard(CategoryModel e) {
//     return Column(
//       children: [
//         InkWell(
//           onTap: () {
//             Navigator.of(context)
//                 .pushNamed("/single-category", arguments: e.id.toString());
//           },
//           child: Container(
//               margin: EdgeInsets.symmetric(horizontal: 8),
//               decoration: BoxDecoration(
//                 color: CustomTheme.whitetextColor,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
//               child: Text(
//                 e.categoryName.toString() + "\n",
//                 style: TextStyle(color: CustomTheme.lightTextColor),
//               )),
//         ),
//         SizedBox(height: 5),
//       ],
//     );
//   }

//   Widget ProductCard(ProductModel e) {
//     return Column(
//       children: [
//         InkWell(
//           onTap: () {
//             Navigator.of(context).pushNamed("/single-product", arguments: e.id);
//           },
//           child: Container(
//               decoration: BoxDecoration(
//                   color: Colors.white, borderRadius: BorderRadius.circular(12)),
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(
//                         top: 10, bottom: 20, left: 10, right: 10),
//                     child: Image.network(
//                       e.imageUrl.toString(),
//                       height: 120,
//                       width: 130,
//                       fit: BoxFit.cover,
//                       errorBuilder: (BuildContext context, Object exception,
//                           StackTrace? stackTrace) {
//                         return Image.asset(
//                           'assets/images/logo.png',
//                           height: 120,
//                           width: 130,
//                           fit: BoxFit.cover,
//                         );
//                       },
//                     ),
//                   ),
//                   Text(
//                     e.productName.toString(),
//                     style: TextStyle(
//                       color: CustomTheme.darkTextColor,
//                       fontSize: 16,
//                       fontWeight: FontWeight.normal,
//                     ),
//                   ),
//                   // SizedBox(height: 20,),
//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Text(
//                       "Rs ." + e.productPrice.toString(),
//                       style: TextStyle(
//                         color: CustomTheme.darkTextColor,
//                         fontSize: 16,
//                         fontWeight: FontWeight.normal,
//                       ),
//                     ),
//                   ),
//                 ],
//               )),
//         ),
//       ],
//     );
//   }
// }
