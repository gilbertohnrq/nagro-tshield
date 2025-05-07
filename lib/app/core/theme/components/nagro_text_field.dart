// coverage:ignore-file
import 'package:finan/app/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NagroTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? infoText;
  final String? labelText;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChange;
  final bool? isPassword;
  final List<TextInputFormatter>? maskTextInputFormatter;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  final bool autoCorrect;
  final Widget? suffixIcon;

  const NagroTextField({
    super.key,
    this.controller,
    this.hintText,
    this.infoText,
    this.labelText,
    this.validator,
    this.onChange,
    this.isPassword,
    this.maskTextInputFormatter,
    this.keyboardType,
    this.focusNode,
    this.onFieldSubmitted,
    this.autoCorrect = true,
    this.suffixIcon
  });

  @override
  State<NagroTextField> createState() => NagroTextFieldState();
}

class NagroTextFieldState extends State<NagroTextField> {
  late bool isObscure;

  @override
  void initState() {
    super.initState();
    isObscure = widget.isPassword ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          autocorrect: widget.autoCorrect,
          focusNode: widget.focusNode,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          inputFormatters: widget.maskTextInputFormatter,
          style: ThemeTypography.body1.copyWith(
            color: ThemeColors.kTextLight
          ),
          obscureText: widget.isPassword == true && isObscure,
          onFieldSubmitted: widget.onFieldSubmitted,
          decoration: InputDecoration(
            suffixIcon: widget.suffixIcon ?? ((widget.isPassword != null && widget.isPassword!)
                ? InkWell(
                    onTap: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    child: Icon(
                      isObscure
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: ThemeColors.kGrayEnabled,
                      size: 20,
                    ),
                  )
                : null),
            hintText: (widget.hintText == null && widget.labelText == null) ? '' : widget.hintText,
            hintStyle: inputText1,
            labelStyle: inputText1,
            labelText: widget.labelText,
            alignLabelWithHint: true,
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: ThemeColors.kGrayEnabled),
              borderRadius: BorderRadius.circular(ThemeRadius.r8),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: ThemeSpacings.s12,
            ),
          ),
          validator: widget.validator,
          onChanged: widget.onChange,
        ),
        if (widget.infoText != null)
          Text(
            widget.infoText.toString(),
            style: ThemeTypography.body1.copyWith(
              color: ThemeColors.kGrayEnabled,
            ),
          ),
      ],
    );
  }
}
