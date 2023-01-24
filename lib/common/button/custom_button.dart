import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app/theme.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;

  const CustomButton({
    required this.title,
    this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Center(
        child: Container(
            height: 52,
            decoration: BoxDecoration(
              color: CustomTheme.primaryColor,
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(12), bottom: Radius.circular(12)),
            ),
            child: Center(
              child: Text(title,
                  style: TextStyle(
                    color: CustomTheme.whitetextColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  )),
            )),
      ),
    );
  }
}
