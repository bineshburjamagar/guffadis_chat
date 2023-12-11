import 'package:flutter/material.dart';

import '../../config/config.dart';

typedef OnClickTypeAheadSuggestion = void Function(String)?;

class CustomTextField extends StatefulWidget {
  final String labelText;
  final TextEditingController? controller;
  final bool isPassword;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool showRequired;
  final VoidCallback? onTap;
  final bool readOnly;
  final int? maxLines;
  final EdgeInsets? contentPadding;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? prefixText;
  final TextStyle? hintStyle;
  final bool isFilled;
  final bool isNewLabel;
  final TextAlign? textAlign;
  final double? borderRadius;
  final Function(String)? onSubmitted;
  final Function(String)? onChanged;
  final String? initialValue;
  final bool? autoFocus;
  final TextInputAction? textInputAction;
  final Color? titleColor;
  final AutovalidateMode? autoValidateMode;
  final FocusNode? focusNode;
  const CustomTextField({
    Key? key,
    required this.labelText,
    this.focusNode,
    this.controller,
    this.isPassword = false,
    this.validator,
    this.keyboardType,
    this.hintText,
    this.showRequired = false,
    this.readOnly = false,
    this.onTap,
    this.maxLines,
    this.contentPadding,
    this.suffixIcon,
    this.isFilled = false,
    // this.labelStyle,
    this.isNewLabel = false,
    this.prefixIcon,
    this.onSubmitted,
    this.onChanged,
    this.initialValue,
    this.autoFocus = false,
    this.textInputAction,
    this.textAlign,
    this.prefixText,
    this.borderRadius,
    this.hintStyle,
    this.autoValidateMode,
    this.titleColor,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _showPassword = true;

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.withOpacity(0.6)),
      borderRadius: BorderRadius.circular(widget.borderRadius ?? 10.0),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText.isNotEmpty) ...[
          RichText(
            text: TextSpan(
              text: widget.labelText,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: widget.titleColor ?? Colors.green,
                fontFamily: "Inter",
              ),
              children: [
                if (widget.showRequired) ...{
                  const TextSpan(
                    text: " *",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Colors.red,
                      fontFamily: "Inter",
                    ),
                  ),
                }
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          )
        ],
        TextFormField(
          focusNode: widget.focusNode,
          textAlign: widget.textAlign ?? TextAlign.start,
          initialValue: widget.initialValue,
          readOnly: widget.readOnly,
          keyboardType: widget.keyboardType,
          autovalidateMode: widget.autoValidateMode,
          obscureText: (widget.isPassword) ? _showPassword : false,
          controller: widget.controller,
          autofocus: widget.autoFocus ?? false,
          validator: widget.validator,
          cursorColor: AppColors.primaryColor,
          onTap: widget.onTap,
          maxLines: widget.maxLines ?? 1,
          onChanged: widget.onChanged,
          textInputAction: widget.textInputAction ?? TextInputAction.next,
          decoration: InputDecoration(
            prefixText: widget.prefixText,
            prefixStyle: TextStyle(color: AppColors.primaryColor, fontSize: 16),
            fillColor:
                widget.isFilled ? Colors.grey.withOpacity(0.6) : Colors.white,
            filled: true,
            errorMaxLines: 2,
            border: outlineInputBorder,
            enabledBorder: outlineInputBorder,
            focusedBorder: outlineInputBorder,
            errorBorder: outlineInputBorder.copyWith(
              borderSide: const BorderSide(color: Colors.red),
            ),
            disabledBorder: outlineInputBorder,
            hintText: widget.hintText,
            hintStyle: widget.hintStyle ??
                TextStyle(
                    color: Colors.grey.withOpacity(0.6),
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon ??
                (widget.isPassword
                    ? InkWell(
                        onTap: () =>
                            setState(() => _showPassword = !_showPassword),
                        child: _showPassword
                            ? const Icon(
                                Icons.visibility_off_outlined,
                                size: 18.0,
                                color: Colors.grey,
                              )
                            : const Icon(
                                Icons.visibility_outlined,
                                size: 18.0,
                                color: Colors.grey,
                              ),
                      )
                    : null),
            contentPadding: widget.contentPadding ??
                const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
          ),
          onFieldSubmitted: widget.onSubmitted,
        ),
      ],
    );
  }
}
