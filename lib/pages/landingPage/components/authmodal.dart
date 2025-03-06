// ignore_for_file: use_build_context_synchronously

import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:ischool/config/responsive.dart';
import 'package:ischool/config/size_config.dart';
import 'package:ischool/pages/Dashboard/dashboard.dart';
import 'package:ischool/pages/landingPage/components/contact_form_field.dart';
import 'package:ischool/providers/auth_provider.dart';
import 'package:ischool/utils/app_styles.dart';
import 'package:provider/provider.dart';

class AuthModal extends StatefulWidget {
  final void Function(PointerDownEvent)? onTapOutside;
  const AuthModal({super.key, required this.onTapOutside});

  @override
  State<AuthModal> createState() => _AuthModalState();
}

class _AuthModalState extends State<AuthModal> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    emailController;
    passwordController;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      alignment: Alignment.center,
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight,
      child: TapRegion(
        onTapOutside: widget.onTapOutside,
        child: Consumer<AuthProvider>(
          builder:
              (BuildContext context, AuthProvider provider, Widget? child) {
            return Container(
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
                      onPressed: provider.isLoading
                          ? null
                          : () async {
                              if (emailController.text.isNotEmpty &&
                                  passwordController.text.isNotEmpty) {
                                final int response =
                                    await provider.authenticateUser(
                                        emailController.text,
                                        passwordController.text);

                                if (response == 201) {
                                  DelightToastBar(
                                    snackbarDuration:
                                        const Duration(milliseconds: 2000),
                                    position: DelightSnackbarPosition.top,
                                    autoDismiss: true,
                                    builder: (context) => ToastCard(
                                      color: AppTheme.accent,
                                      leading: const Icon(
                                          Icons.verified_outlined,
                                          size: 28,
                                          color: Colors.white),
                                      title: const Text(
                                        "Login successful",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.white),
                                      ),
                                    ),
                                  ).show(context);
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Dashboard()));
                                } else {
                                  DelightToastBar(
                                    snackbarDuration:
                                        const Duration(milliseconds: 2000),
                                    position: DelightSnackbarPosition.top,
                                    autoDismiss: true,
                                    builder: (context) => ToastCard(
                                      color: Colors.red[300],
                                      leading: const Icon(Icons.cancel_outlined,
                                          size: 28, color: Colors.white),
                                      title: const Text(
                                        "Invalid credentials",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.white),
                                      ),
                                    ),
                                  ).show(context);
                                }
                              }
                            },
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                            provider.isLoading
                                ? AppTheme.accent.withOpacity(0.8)
                                : AppTheme.accent),
                        padding: const WidgetStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 40.0, vertical: 5.0),
                        ),
                      ),
                      child: Text(
                        provider.isLoading ? "Authennticating..." : "Login",
                        style: const TextStyle(color: Colors.white),
                      ),
                    )
                  ]),
            );
          },
        ),
      ),
    );
  }
}
