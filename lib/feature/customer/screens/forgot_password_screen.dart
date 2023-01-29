import 'package:ecommerce/viewmodels/auth_viewmodel.dart';
import 'package:ecommerce/viewmodels/global_ui_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/app/theme.dart';
import '../../../common/button/custom_button.dart';
import '../../../common/icon/custom_icon.dart';
import '../../../common/textfield/custom_textfield.dart';

class ForgotPasswordSreen extends StatefulWidget {
  const ForgotPasswordSreen({super.key});

  @override
  State<ForgotPasswordSreen> createState() => _ForgotPasswordSreenState();
}

class _ForgotPasswordSreenState extends State<ForgotPasswordSreen> {
  final TextEditingController _emailController = TextEditingController();

  late GlobalUIViewModel _ui;
  late AuthViewModel _auth;
  void resetPassword() async {
    _ui.loadState(true);
    try {
      await _auth.resetPassword(_emailController.text).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Password reset link has been sent to your email.")));
        Navigator.of(context).pop();
      }).catchError((e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.message.toString())));
      });
    } catch (err) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(err.toString())));
    }
    _ui.loadState(false);
  }

  @override
  void initState() {
    _ui = Provider.of<GlobalUIViewModel>(context, listen: false);
    _auth = Provider.of<AuthViewModel>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFAE1DFFD),
        // appBar: AppBar(
        // ),
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).viewPadding.top + 40,
                  ),
                  CustomIcon(icon: Icons.arrow_back),
                  Container(
                    padding: EdgeInsets.only(top: 50, bottom: 20),
                    child: Text("Forgot Password",
                        style: TextStyle(
                          color: CustomTheme.darkGray,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Text(
                    "We’ll sent reset link to your email",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      letterSpacing: 0.3,
                      color: CustomTheme.darkGray,
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    child: Column(
                      children: [
                        CustomTextField(
                          hintText: "Email address",
                          controller: _emailController,
                          prefixIcon: Icon(
                            Icons.email,
                            color: CustomTheme.lightTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  CustomButton(
                    title: 'Reset',
                    onPressed: () {
                      resetPassword();
                    },
                  ),
                ],
              )),
        ));
  }
}
