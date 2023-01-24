import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../common/app/theme.dart';
import '../../../../common/icon/custom_icon.dart';

class OtpVerificationWidget extends StatefulWidget {
  const OtpVerificationWidget({super.key});

  @override
  State<OtpVerificationWidget> createState() => _OtpVerificationWidgetState();
}

class _OtpVerificationWidgetState extends State<OtpVerificationWidget> {
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
                    child: Text("Verify OTP",
                        style: TextStyle(
                          color: CustomTheme.darkGray,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Text(
                    "Please enter 5 digit OTP code",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      letterSpacing: 0.3,
                      color: CustomTheme.darkGray,
                    ),
                  ),
                  SizedBox(height: 30),
                  // Container(
                  //   child: Column(
                  //     children: [
                  //       PinCodeTextField(
                  //         length: 5,
                  //         obscureText: false,
                  //         appContext: context,
                  //         cursorColor: CustomTheme.primaryColor,
                  //         mainAxisAlignment: MainAxisAlignment.start,
                  //         animationType: AnimationType.fade,
                  //         pinTheme: PinTheme(
                  //           shape: PinCodeFieldShape.box,
                  //           borderRadius: BorderRadius.circular(12),
                  //           fieldHeight: 55,
                  //           fieldWidth: 55,
                  //           activeFillColor: Colors.white,
                  //           activeColor: Colors.white,
                  //           inactiveFillColor: Colors.white,
                  //           inactiveColor: Colors.white,
                  //           selectedColor: Colors.white,
                  //           selectedFillColor: Colors.white,
                  //           fieldOuterPadding: EdgeInsets.only(right: 12),
                  //         ),
                  //         animationDuration: Duration(milliseconds: 300),
                  //         enableActiveFill: true,
                  //         onCompleted: (v) {
                  //           print("Completed");
                  //         },
                  //         onChanged: (v) {},
                  //       ),
                  //       SizedBox(height: 40),
                  //       CustomButton(
                  //         title: 'Verify',
                  //         onPressed: () {
                  //           Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                   builder: (context) =>
                  //                       ConfirmPasswordScreen()));
                  //         },
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Container(
                    padding: EdgeInsets.only(top: 40),
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                            child: RichText(
                                text: TextSpan(
                                    text: "Don’t received any code ?  ",
                                    style: TextStyle(
                                      color: CustomTheme.darkTextColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    children: [
                                  TextSpan(
                                    text: "Resend",
                                    style: TextStyle(
                                      color: CustomTheme.primaryColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {},
                                  ),
                                ])),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )),
        ));
  }
}
