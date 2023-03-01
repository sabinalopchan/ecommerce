import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/auth_viewmodel.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late AuthViewModel _authViewModel;

  void checkLogin() async{
    await Future.delayed(Duration(seconds: 2));
      await _authViewModel.checkLogin();
        Navigator.of(context).pushReplacementNamed("/login");
  }
  @override
  void initState() {
    _authViewModel = Provider.of<AuthViewModel>(context, listen: false);
     checkLogin();
     super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/images/splash.gif"),
              SizedBox(height: 100,),
              Text("", style: TextStyle(
                fontSize: 22
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
