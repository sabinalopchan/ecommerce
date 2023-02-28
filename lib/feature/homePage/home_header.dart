import 'package:flutter/material.dart';

import '../../common/app/theme.dart';
import 'home_page.dart';
import 'home_screen.dart';

class HomePageHeader extends StatefulWidget {
  const HomePageHeader({super.key});

  @override
  State<HomePageHeader> createState() => _HomePageHeaderState();
}

class _HomePageHeaderState extends State<HomePageHeader> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.backgroudColor,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: CustomTheme.backgroudColor,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            icon: Icon(
              Icons.menu,
              size: 30,
              color: Colors.black,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black,
              size: 25,
            ),
          )
        ],
      ),
      drawer: Drawer(
          backgroundColor: CustomTheme.backgroudColor,
          child: Column(
            children: [
              Container(
                  color: CustomTheme.primaryColor,
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).viewPadding.top + 20,
                      bottom: 15,
                      left: 15,
                      right: 15),
                  child: Row(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(300.0),
                      child: Container(
                        color: CustomTheme.primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "assets/images/logo.png",
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sabina Tamang",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "Nuwakot",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    )
                  ])),
              ListTile(
                title: Text("My products"),
                leading: Icon(Icons.production_quantity_limits),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
                onTap: () {
                  Navigator.of(context).pushNamed('/product_screen');
                },
              ),
              ListTile(
                title: Text("Setting"),
                leading: Icon(Icons.settings),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
                onTap: () {},
              ),
              ListTile(
                title: Text("Logout"),
                leading: Icon(Icons.exit_to_app),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
                onTap: () {
                  Navigator.of(context).pushNamed('/login');
                },
              ),
            ],
          )),
      body: HomeScreen(),
    );
  }
}
