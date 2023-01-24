import 'package:ecommerce/feature/customer/screens/register_screen.dart';
import 'package:ecommerce/viewmodels/auth_viewmodel.dart';
import 'package:ecommerce/viewmodels/global_ui_viewmodel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

import 'feature/customer/screens/login_screen.dart';

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
                textTheme: GoogleFonts.latoTextTheme(),
              ),
              initialRoute: "/login",
              routes: {
                "/login": (BuildContext context) => LoginScreen(),
                "/register": (BuildContext context) => RegisterScreen(),
              },
            );
          },
        ),
      ),
    );
  }
}
