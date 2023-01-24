import 'package:flutter/material.dart';

import '../../../common/app/theme.dart';
import '../../../../common/button/custom_button.dart';
import '../../../../common/icon/custom_icon.dart';
import '../../../../common/textfield/custom_textfield.dart';
import '../screens/login_screen.dart';

class ConfirmPasswordWidget extends StatefulWidget {
  const ConfirmPasswordWidget({super.key});

  @override
  State<ConfirmPasswordWidget> createState() => _ConfirmPasswordWidgetState();
}

class _ConfirmPasswordWidgetState extends State<ConfirmPasswordWidget> {
  final _formKey = GlobalKey<FormState>();
  var confirmPass;
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
                    child: Text("Confirm Password",
                        style: TextStyle(
                          color: CustomTheme.darkGray,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Text(
                    "Reset your password",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      letterSpacing: 0.3,
                      color: CustomTheme.darkGray,
                    ),
                  ),
                  SizedBox(height: 15),
                  Form(
                    key: _formKey,
                    child: Container(
                      child: Column(
                        children: [
                          CustomTextField(
                              // label: "",
                              hintText: "New Password",
                              obscureText: true,
                              prefixIcon: Icon(
                                Icons.lock,
                                color: CustomTheme.lightTextColor,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your password";
                                } else if (value.length < 6) {
                                  return "Password must be at least 6 characters";
                                } else {
                                  return null;
                                }
                              }),
                          CustomTextField(
                              // label: "",
                              hintText: "Confirm Password",
                              obscureText: true,
                              prefixIcon: Icon(
                                Icons.lock,
                                color: CustomTheme.lightTextColor,
                              ),
                              validator: (value) {
                                confirmPass = value;
                                if (value == null || value.isEmpty) {
                                  return "Please Re-enter new password";
                                } else if (value.length < 6) {
                                  return "Password must be at least 6 characters";
                                } else if (value != confirmPass) {
                                  return "Password does not match";
                                } else {
                                  return null;
                                }
                              }),
                          //  SizedBox(height:5),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  CustomButton(
                      title: 'Confirm',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        }
                      }),
                ],
              )),
        ));
  }
}
