import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/app/theme.dart';
import '../../../../common/button/custom_button.dart';
import '../../../../common/textfield/custom_textfield.dart';
import '../../../viewmodels/auth_viewmodel.dart';
import '../../../viewmodels/global_ui_viewmodel.dart';
import '../screens/forgot_password_screen.dart';
import '../screens/register_screen.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  late GlobalUIViewModel _ui;
  late AuthViewModel _auth;

  @override
  void initState() {
    _ui = Provider.of<GlobalUIViewModel>(context, listen: false);
    _auth = Provider.of<AuthViewModel>(context, listen: false);
    super.initState();
  }

  void login() async {
    _ui.loadState(true);
    try {
      _auth
          .login(_emailController.text, _passwordController.text)
          .then((value) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Login success")));
        Navigator.of(context).pushNamed('/register');
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
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: CustomTheme.backgroudColor,
        body: SingleChildScrollView(
          child: Container(
            height: _height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).viewPadding.top + 40,
                      ),
                      // Text("Logo",
                      //     style: TextStyle(
                      //       color: CustomTheme.darkGray,
                      //       fontSize: 28,
                      //       fontWeight: FontWeight.bold,
                      //     )),
                      SizedBox(
                        height: 30,
                      ),
                      Text("Welcome Back",
                          style: TextStyle(
                            color: CustomTheme.darkGray,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Login your account here",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          letterSpacing: 0.3,
                          color: CustomTheme.darkGray,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Stack(
                  children: [
                    Container(
                      height: 500,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                        color: Colors.white,
                      ),
                    ),
                    Column(
                      children: [
                        Form(
                          key: _formKey,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 24),
                              child: Column(
                                children: [
                                  CustomTextField(
                                      controller: _emailController,
                                      // label: "",
                                      hintText: "Email address",
                                      prefixIcon: Icon(
                                        Icons.email,
                                        color: CustomTheme.lightTextColor,
                                      ),
                                      validator: (value) {
                                        final emailValid = RegExp(
                                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                                        if (value == null || value.isEmpty) {
                                          return "Email cannot be empty";
                                        } else if (emailValid.hasMatch(value)) {
                                          return null;
                                        } else {
                                          return "Invalid email";
                                        }
                                      }),
                                  SizedBox(height: 20),
                                  CustomTextField(
                                    controller: _passwordController,
                                    // label: "",
                                    hintText: "Password",
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: CustomTheme.lightTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: Center(
                            child: Column(
                              children: [
                                CustomButton(
                                  title: 'Login',
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      login();
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             BottomNavigatonScreen()));
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ForgotPasswordSreen()));
                                  },
                                  child: Text(
                                    "Forgot Password ?",
                                    style: TextStyle(
                                      color: CustomTheme.primaryColor,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  child: RichText(
                                      text: TextSpan(
                                          text: "Don't have account ?  ",
                                          style: TextStyle(
                                            color: CustomTheme.darkTextColor,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          children: [
                                        TextSpan(
                                            text: "Sign up",
                                            style: TextStyle(
                                              color: CustomTheme.primaryColor,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            RegisterScreen()));
                                              }),
                                      ])),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                // SizedBox(height: 40),
                // Column(
                //   children: [
                //     Form(
                //       key: _formKey,
                //       child: Padding(
                //         padding: const EdgeInsets.only(top: 50),
                //         child: Container(
                //           padding: EdgeInsets.symmetric(horizontal: 24),
                //           child: Column(
                //             children: [
                //               CustomTextField(
                //                   controller: _emailController,
                //                   // label: "",
                //                   hintText: "Email address",
                //                   prefixIcon: Icon(
                //                     Icons.email,
                //                     color: CustomTheme.lightTextColor,
                //                   ),
                //                   validator: (value) {
                //                     final emailValid = RegExp(
                //                         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                //                     if (value == null || value.isEmpty) {
                //                       return "Email cannot be empty";
                //                     } else if (emailValid.hasMatch(value)) {
                //                       return null;
                //                     } else {
                //                       return "Invalid email";
                //                     }
                //                   }),
                //               SizedBox(height: 20),
                //               CustomTextField(
                //                 controller: _passwordController,
                //                 // label: "",
                //                 hintText: "Password",
                //                 prefixIcon: Icon(
                //                   Icons.lock,
                //                   color: CustomTheme.lightTextColor,
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //     ),
                //     SizedBox(height: 40),
                //     Container(
                //       padding: EdgeInsets.symmetric(horizontal: 24),
                //       child: Center(
                //         child: Column(
                //           children: [
                //             CustomButton(
                //               title: 'Login',
                //               onPressed: () {
                //                 if (_formKey.currentState!.validate()) {
                //                   login();
                //                   // Navigator.push(
                //                   //     context,
                //                   //     MaterialPageRoute(
                //                   //         builder: (context) =>
                //                   //             BottomNavigatonScreen()));
                //                 }
                //               },
                //             ),
                //             SizedBox(
                //               height: 20,
                //             ),
                //             GestureDetector(
                //               onTap: () {
                //                 Navigator.push(
                //                     context,
                //                     MaterialPageRoute(
                //                         builder: (context) =>
                //                             ForgotPasswordSreen()));
                //               },
                //               child: Text(
                //                 "Forgot Password ?",
                //                 style: TextStyle(
                //                   color: CustomTheme.primaryColor,
                //                 ),
                //               ),
                //             ),
                //             SizedBox(height: 20),
                //             Container(
                //               child: RichText(
                //                   text: TextSpan(
                //                       text: "Don't have account ?  ",
                //                       style: TextStyle(
                //                         color: CustomTheme.darkTextColor,
                //                         fontSize: 15,
                //                         fontWeight: FontWeight.w400,
                //                       ),
                //                       children: [
                //                     TextSpan(
                //                         text: "Sign up",
                //                         style: TextStyle(
                //                           color: CustomTheme.primaryColor,
                //                           fontSize: 15,
                //                           fontWeight: FontWeight.w500,
                //                         ),
                //                         recognizer: TapGestureRecognizer()
                //                           ..onTap = () {
                //                             Navigator.push(
                //                                 context,
                //                                 MaterialPageRoute(
                //                                     builder: (context) =>
                //                                         RegisterScreen()));
                //                           }),
                //                   ])),
                //             ),
                //           ],
                //         ),
                //       ),
                //     )
                //   ],
                // ),
              ],
            ),
          ),
        ));
  }
}
