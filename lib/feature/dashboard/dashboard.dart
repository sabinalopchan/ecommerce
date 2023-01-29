import 'package:flutter/material.dart';

import '../../common/app/theme.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  PageController _pageController = PageController();
  int _selectedIndex = 0;
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
            // HomePageScreen(),
            // ProductCartScreen(),
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
