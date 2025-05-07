// coverage:ignore-file
import 'package:finan/app/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomOutlinedTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  final TextInputType keyboardType;
  final bool obscureText;
  final List<TextInputFormatter>? maskTextInputFormatter;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  const CustomOutlinedTextField(
      {super.key,
      required this.controller,
      this.labelText,
      this.hintText,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.maskTextInputFormatter,
      this.validator,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      inputFormatters: maskTextInputFormatter,
      validator: validator,
      onChanged: onChanged,
      style: ThemeTypography.body2.copyWith(color: ThemeColors.kTextBase),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:
            ThemeTypography.body1.copyWith(color: ThemeColors.kGrayEnabled),
        labelText: labelText,
        labelStyle:
            ThemeTypography.body3.copyWith(color: ThemeColors.kGrayEnabled),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: ThemeColors.kCloseGray),
          borderRadius: BorderRadius.circular(ThemeRadius.r8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ThemeColors.kPrimary),
          borderRadius: BorderRadius.circular(ThemeRadius.r8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ThemeColors.kCloseGray),
          borderRadius: BorderRadius.circular(ThemeRadius.r8),
        ),
      ),
    );
  }
}
