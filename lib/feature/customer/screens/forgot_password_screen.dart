import 'package:flutter/src/widgets/framework.dart';

import '../widgets/forgot_password_widget.dart';

class ForgotPasswordSreen extends StatefulWidget {
  const ForgotPasswordSreen({super.key});

  @override
  State<ForgotPasswordSreen> createState() => _ForgotPasswordSreenState();
}

class _ForgotPasswordSreenState extends State<ForgotPasswordSreen> {
  @override
  Widget build(BuildContext context) {
    return ForgotPasswordWidget();
  }
}
