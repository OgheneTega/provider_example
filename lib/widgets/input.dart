import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? initialValue;
  final TextInputType inputType;
  final TextEditingController? textController;
  final String? label;
  final String? hintText;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final bool fullBorder;
  final bool filled;
  final int? maxLength;
  final int? maxLines;
  final int minLines;
  final TextInputAction keyboardAction;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function()? onTap;
  final void Function(String?)? onChanged;
  final void Function(String?)? onFieldSubmitted;
  final void Function()? onEditComplete;
  final Color? borderColor,
      enabledBorderColor,
      errorBorderColor,
      labelColor,
      textColor,
      fillColor,
      errorTextColor,
      hintTextColor;
  final bool showLabel;
  final TextStyle? textStyle;
  final TextAlign textAlign;
  final double borderRadius;
  final List<TextInputFormatter> inputFormatters;
  final TextCapitalization textCapitalization;

  const Input({
    Key? key,
    this.label,
    required this.hintText,
    this.initialValue,
    this.textController,
    this.inputType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.filled = true,
    this.fullBorder = true,
    this.maxLines,
    this.minLines = 1,
    this.maxLength,
    this.keyboardAction = TextInputAction.next,
    this.focusNode,
    this.validator,
    this.onSaved,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
    this.onEditComplete,
    this.borderColor = Colors.black,
    this.enabledBorderColor = Colors.black12,
    this.errorBorderColor = Colors.red,
    this.labelColor = Colors.black,
    this.textColor = Colors.black,
    this.hintTextColor = Colors.black38,
    this.errorTextColor = Colors.red,
    this.fillColor = const Color(0xFFF3F3F3),
    this.showLabel = true,
    this.textStyle,
    this.textAlign = TextAlign.start,
    this.borderRadius = 16,
    this.inputFormatters = const [],
    this.textCapitalization = TextCapitalization.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      initialValue: initialValue,
      textAlign: textAlign,
      inputFormatters: inputFormatters,
      textCapitalization: textCapitalization,
      decoration: InputDecoration(
        contentPadding: !fullBorder
            ? null
            : const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        labelText: showLabel ? label : null,
        labelStyle: TextStyle(
          color: labelColor,
          fontSize: 18,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: fullBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              )
            : const UnderlineInputBorder(),
        focusedBorder: fullBorder
            ? OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(borderRadius),
              )
            : const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
        errorBorder: fullBorder
            ? OutlineInputBorder(
                borderSide: BorderSide(color: errorBorderColor!, width: 1),
                borderRadius: BorderRadius.circular(borderRadius),
              )
            : UnderlineInputBorder(
                borderSide: BorderSide(color: errorBorderColor!, width: 1),
              ),
        enabledBorder: fullBorder
            ? OutlineInputBorder(
                borderSide: BorderSide(color: fillColor!),
                borderRadius: BorderRadius.circular(borderRadius),
              )
            : const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black12),
              ),
        filled: filled,
        hintStyle: TextStyle(
          color: hintTextColor,
        ),
        hintText: hintText,
        fillColor: fillColor,
        errorStyle: TextStyle(
          color: errorTextColor,
          fontSize: 14,
        ),
      ),
      style: textStyle ?? TextStyle(color: textColor),
      enabled: enabled,
      obscureText: obscureText,
      readOnly: readOnly,
      keyboardType: minLines > 1 ? TextInputType.multiline : inputType,
      textInputAction: keyboardAction,
      validator: validator,
      onSaved: onSaved,
      focusNode: focusNode,
      onTap: onTap,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      controller: textController,
      onEditingComplete: onEditComplete,
      maxLength: maxLength,
      maxLines: obscureText ? 1 : maxLines,
      minLines: minLines,
    );
  }
}
