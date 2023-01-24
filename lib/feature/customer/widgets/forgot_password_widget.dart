import 'package:flutter/material.dart';

import '../../../common/app/theme.dart';
import '../../../../common/button/custom_button.dart';
import '../../../../common/icon/custom_icon.dart';
import '../../../../common/textfield/custom_textfield.dart';
import '../screens/otp_verification_screen.dart';

class ForgotPasswordWidget extends StatefulWidget {
  const ForgotPasswordWidget({super.key});

  @override
  State<ForgotPasswordWidget> createState() => _ForgotPasswordWidgetState();
}

class _ForgotPasswordWidgetState extends State<ForgotPasswordWidget> {
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
                    "We’ll email you a code to reset your password",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      letterSpacing: 0.3,
                      color: CustomTheme.darkGray,
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    child: Column(
                      children: [
                        CustomTextField(
                          // label: "",
                          hintText: "Email address",
                          prefixIcon: Icon(
                            Icons.email,
                            color: CustomTheme.lightTextColor,
                          ),
                        ),
                        //  SizedBox(height:5),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  CustomButton(
                    title: 'Reset',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OtpVerificationScreen()));
                    },
                  ),
                ],
              )),
        ));
  }
}
