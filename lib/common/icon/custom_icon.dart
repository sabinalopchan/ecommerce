import 'package:flutter/material.dart';

import '../app/theme.dart';

class CustomIcon extends StatelessWidget {
  final IconData icon;
  const CustomIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Icon(
        icon,
        color: CustomTheme.darkGray,
        size: 20,
      ),
    ));
  }
}
