import 'package:ecommerce/viewmodels/auth_viewmodel.dart';
import 'package:ecommerce/viewmodels/global_ui_viewmodel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

import 'feature/customer/forgot_password_screen.dart';
import 'feature/customer/login_screen.dart';
import 'feature/customer/register_screen.dart';
import 'feature/dashboard/dashboard.dart';
import 'feature/products/add_product_screen.dart';
import 'feature/products/edit_product_screen.dart';
import 'feature/products/my_product_screen.dart';
import 'feature/products/single_product_screen.dart';
import 'viewmodels/category_viewmodel.dart';
import 'viewmodels/product_viewmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GlobalUIViewModel()),
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => CategoryViewModel()),
        ChangeNotifierProvider(create: (_) => ProductViewModel()),
      ],
      child: GlobalLoaderOverlay(
        useDefaultLoading: false,
        overlayWidget: Center(
          child:
              Image.asset("assets/images/loader.gif", height: 100, width: 100),
        ),
        child: Consumer<GlobalUIViewModel>(
          builder: (context, loader, child) {
            if (loader.isLoading) {
              context.loaderOverlay.show();
            } else {
              context.loaderOverlay.hide();
            }
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Ecommerce',
              theme: ThemeData(
                primarySwatch: Colors.blue,
                // textTheme: GoogleFonts.openSansTextTheme(),
              ),
              initialRoute: "/login",
              routes: {
                "/login": (BuildContext context) => LoginScreen(),
                "/register": (BuildContext context) => RegisterScreen(),
                "/forgot_password": (BuildContext context) =>
                    ForgotPasswordSreen(),
                "/dashboard": (BuildContext context) => DashboardScreen(),
                "/single-product": (BuildContext context) =>
                    SingleProductScreen(),
                "/product_screen": (BuildContext context) => MyProductScreen(),
                "/add-product": (BuildContext context) => AddProductScreen(),
                "/edit-product": (BuildContext context) => EditProductScreen(),
              },
            );
          },
        ),
      ),
    );
  }
}
