import 'package:flutter/material.dart';
import 'package:ischool/config/responsive.dart';
import 'package:ischool/utils/app_styles.dart';


class LoginBtn extends StatelessWidget {
  final void Function()? toggleVisibility;
  const LoginBtn({super.key, required this.toggleVisibility});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: toggleVisibility,
      style: ButtonStyle(
        side: WidgetStateProperty.all(
          BorderSide(
            color: AppTheme.accent,
          ),
        ),
      ),
      child: Text(
        "Login",
        style: TextStyle(fontSize: Responsive.isMobile(context) ? 10 : 16),
      ),
    );
  }
}
