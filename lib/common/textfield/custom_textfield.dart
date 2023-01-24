import 'package:control_style/control_style.dart';
import 'package:flutter/material.dart';

import '../app/theme.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextInputType? textInputType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  CustomTextField({
    required this.hintText,
    this.textInputType,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.validator,
    this.controller,
  });
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          Container(
            height: 70,
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              obscureText: widget.obscureText,
              controller: widget.controller,
              decoration: InputDecoration(
                  prefixIcon: widget.prefixIcon,
                  suffixIcon: widget.suffixIcon,
                  border: DecoratedInputBorder(
                    child: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    shadow: [
                      BoxShadow(
                        color: CustomTheme.backgroudColor,
                        blurRadius: 8,
                      )
                    ],
                  ),
                  disabledBorder: InputBorder.none,
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 13,
                  ),
                  hintText: widget.hintText,
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: CustomTheme.lightTextColor,
                  )),
              validator: widget.validator,
            ),
          ),
        ],
      ),
    );
  }
}
