import 'package:flutter/material.dart';
import 'package:ischool/config/responsive.dart';
import 'package:ischool/config/size_config.dart';
import 'package:ischool/pages/landingPage/components/contact_form_field.dart';
import 'package:ischool/utils/app_styles.dart';

class AuthModal extends StatelessWidget {
  final void Function(PointerDownEvent)? onTapOutside;
  const AuthModal({super.key, required this.onTapOutside});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Container(
      alignment: Alignment.center,
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight,
      child: TapRegion(
        onTapOutside: onTapOutside,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          width: !Responsive.isDesktop(context)
              ? SizeConfig.screenWidth! * 0.8
              : SizeConfig.screenWidth! * 0.3,
          height: !Responsive.isDesktop(context)
              ? SizeConfig.screenHeight! * 0.8
              : SizeConfig.screenHeight! * 0.5,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppTheme.accent, width: 0.5),
            borderRadius: const BorderRadius.all(Radius.circular(25)),
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      "Welcome back",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.accent,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ContactFormField(
                  controller: emailController,
                  labelText: 'Email Address',
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: const Icon(Icons.email_outlined),
                ),
                const SizedBox(height: 10),
                ContactFormField(
                  controller: passwordController,
                  labelText: 'Password',
                  isObscured: true,
                  maxLines: 1,
                  keyboardType: TextInputType.visiblePassword,
                  prefixIcon: const Icon(Icons.key),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(AppTheme.accent),
                    padding: const WidgetStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 5.0),
                    ),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
