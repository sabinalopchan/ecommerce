import 'package:flutter/src/widgets/framework.dart';

import '../widgets/confirm_password_widget.dart';

class ConfirmPasswordScreen extends StatefulWidget {
  const ConfirmPasswordScreen({super.key});

  @override
  State<ConfirmPasswordScreen> createState() => _ConfirmPasswordScreenState();
}

class _ConfirmPasswordScreenState extends State<ConfirmPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return ConfirmPasswordWidget();
  }
}
