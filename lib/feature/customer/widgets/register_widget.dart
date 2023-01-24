import 'package:ecommerce/viewmodels/auth_viewmodel.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/app/theme.dart';
import '../../../../common/button/custom_button.dart';
import '../../../../common/textfield/custom_textfield.dart';
import '../../../models/user_model.dart';
import '../../../viewmodels/global_ui_viewmodel.dart';
import '../screens/login_screen.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _confirmPasswordController =
      new TextEditingController();
  var confirmPass;

  final _formKey = GlobalKey<FormState>();

  late GlobalUIViewModel _ui;
  late AuthViewModel _auth;

  @override
  void initState() {
    _ui = Provider.of<GlobalUIViewModel>(context, listen: false);
    _auth = Provider.of<AuthViewModel>(context, listen: false);
    super.initState();
  }

  void register() async {
    _ui.loadState(true);
    try {
      await _auth
          .register(UserModel(
              username: _usernameController.text,
              email: _emailController.text,
              password: _passwordController.text))
          .then((value) => null)
          .catchError((e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.message.toString())));
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Registered Successfully")));
      Navigator.of(context).pushNamed('/login');
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
        backgroundColor: Color(0xFFAE1DFFD),
        body: SingleChildScrollView(
          child: Container(
              height: _height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).viewPadding.top + 40,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Logo",
                            style: TextStyle(
                              color: CustomTheme.darkGray,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Welcome ",
                            style: TextStyle(
                              color: CustomTheme.darkGray,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Create your account",
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
                          Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: Form(
                              key: _formKey,
                              child: Container(
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 24),
                                  child: Column(
                                    children: [
                                      CustomTextField(
                                        controller: _usernameController,
                                        // label: "",
                                        hintText: "Username",
                                        prefixIcon: Icon(
                                          Icons.person,
                                          color: CustomTheme.lightTextColor,
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "Username can not be empty";
                                          } else if (value.length < 3) {
                                            return "Username must be at least 3 characters";
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),
                                      //  SizedBox(height:5),
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
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "Email cannot be empty";
                                            } else if (emailValid
                                                .hasMatch(value)) {
                                              return null;
                                            } else {
                                              return "Invalid email";
                                            }
                                          }),
                                      CustomTextField(
                                          controller: _passwordController,
                                          // label: "",
                                          hintText: "Password",
                                          obscureText: true,
                                          prefixIcon: Icon(
                                            Icons.lock,
                                            color: CustomTheme.lightTextColor,
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "Please enter your password";
                                            } else if (value.length < 6) {
                                              return "Password must be at least 6 characters";
                                            } else {
                                              return null;
                                            }
                                          }),
                                      //  SizedBox(height:5),
                                      CustomTextField(
                                          controller:
                                              _confirmPasswordController,
                                          // label: "",
                                          hintText: "Confirm Password",
                                          obscureText: true,
                                          prefixIcon: Icon(
                                            Icons.lock,
                                            color: CustomTheme.lightTextColor,
                                          ),
                                          validator: (value) {
                                            confirmPass = value;
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "Please Re-enter new password";
                                            } else if (value.length < 6) {
                                              return "Password must be at least 6 characters";
                                            } else if (value !=
                                                _passwordController.text) {
                                              return "Password does not match";
                                            } else {
                                              return null;
                                            }
                                          }),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 45),
                      Positioned(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: CustomButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                register();
                                // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Registered successfully")));

                                // );
                              }
                            },
                            title: 'Register',
                          ),
                        ),
                        bottom: 80,
                        right: 0,
                        left: 0,
                      ),
                      Positioned(
                        child: Container(
                          padding: EdgeInsets.only(top: 40),
                          child: Center(
                            child: Column(
                              children: [
                                Container(
                                  child: RichText(
                                      text: TextSpan(
                                          text: "Already have account ?  ",
                                          style: TextStyle(
                                            color: CustomTheme.darkTextColor,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          children: [
                                        TextSpan(
                                          text: "Login",
                                          style: TextStyle(
                                            color: CustomTheme.primaryColor,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Navigator.of(context)
                                                  .pushNamed('/login');
                                            },
                                        ),
                                      ])),
                                ),
                              ],
                            ),
                          ),
                        ),
                        bottom: 30,
                        right: 0,
                        left: 0,
                      ),
                    ],
                  ),
                ],
              )),
        ));
  }
}
