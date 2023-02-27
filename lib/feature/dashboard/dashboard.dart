import 'package:ecommerce/viewmodels/category_viewmodel.dart';
import 'package:ecommerce/viewmodels/global_ui_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/app/theme.dart';
import '../../viewmodels/auth_viewmodel.dart';
import '../../viewmodels/product_viewmodel.dart';
import '../favorite/favorite_screen.dart';
import '../homePage/home_header.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  PageController _pageController = PageController();
  int _selectedIndex = 0;

  _onPageChanges(int index){
    setState(() {
      _selectedIndex=index;
    });
  }

  _itemTapped(int selectedIndex){
    _pageController.jumpToPage(selectedIndex);
    setState(() {
      this._selectedIndex=selectedIndex;
    });
  }

  late GlobalUIViewModel _ui;
  late AuthViewModel _authViewModel;
  late CategoryViewModel _categoryViewModel;
  late ProductViewModel _productViewModel;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _ui=Provider.of<GlobalUIViewModel>(context,listen: false);
      _authViewModel=Provider.of<AuthViewModel>(context,listen:false);
      _categoryViewModel=Provider.of<CategoryViewModel>(context,listen:false);
      _productViewModel=Provider.of<ProductViewModel>(context,listen:false);
      getInit();
    });
    super.initState();
  }

  void getInit() {
    _categoryViewModel.getCategories();
    _productViewModel.getProducts();
    _authViewModel.getFavoritesUser();
    _authViewModel.getMyProducts();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: PageView(
          // scrollDirection: Axis.vertical,
          controller: _pageController,
          // can use this instead of code inside initState
          onPageChanged: (currentIndex) {
            setState(() {
              _selectedIndex = currentIndex;
            });
          },
          children: [
            HomePageHeader(),
            FavoriteScreen(),
            // OrderListScreen(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            selectedItemColor: CustomTheme.primaryColor,
            selectedLabelStyle: TextStyle(color: CustomTheme.primaryColor),
            onTap: (currentIndex) {
              setState(() {
                _selectedIndex = currentIndex;
              });
              _pageController.animateToPage(currentIndex,
                  duration: Duration(milliseconds: 300), curve: Curves.linear);
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: "favurite"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: "cart"),
            ],
          ),
        ),
      ),
    );
  }
}
