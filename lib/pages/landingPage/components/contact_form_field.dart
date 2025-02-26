import 'package:flutter/material.dart';

import 'package:ischool/utils/app_styles.dart';

class ContactFormField extends StatefulWidget {
  final TextEditingController controller;
  final Icon? prefixIcon;
  final int? maxLines;
  final bool? isObscured;
  final TextInputType? keyboardType;
  final String labelText;
  const ContactFormField({
    super.key,
    required this.controller,
    this.prefixIcon,
    this.maxLines,
    this.keyboardType,
    this.isObscured,
    required this.labelText,
  });

  @override
  State<ContactFormField> createState() => _ContactFormFieldState();
}

class _ContactFormFieldState extends State<ContactFormField> {
  late bool isPassword;
  late bool isVisible;
  late bool showPassword;

  @override
  void initState() {
    super.initState();
    isPassword = widget.isObscured ?? false;
    showPassword = widget.isObscured ?? false;
    isVisible = false;
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: widget.keyboardType ?? TextInputType.text,
      obscureText: showPassword,
      maxLines: widget.maxLines,
      controller: widget.controller,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        filled: true,
        fillColor: AppTheme.white,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isObscured ?? false
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    isVisible = !isVisible;
                    showPassword = !showPassword;
                  });
                },
                child: isVisible
                    ? Icon(Icons.visibility_off, color: Colors.grey.shade500)
                    : Icon(Icons.visibility, color: Colors.grey.shade500),
              )
            : null,
        contentPadding: const EdgeInsets.all(15),
        labelText: widget.labelText,
        labelStyle: TextStyle(
          color: Colors.grey.shade500,
          fontSize: 12,
        ),
        hoverColor: Colors.transparent,
        prefixIconColor: Colors.grey.shade500,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppTheme.accent,
          ),
        ),
      ),
    );
  }
}