import 'package:bab_el_ezz/shared_utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../styles/text.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {super.key,
        this.onChanged,
        this.maxLength,
        this.hintText,
        this.leading,
        this.validator,
        this.enabled = true,
        this.controller,
        this.expands = false,
        this.height,
        this.errorText,
        this.trailingIcon,
        this.keyboardType,
        this.node,
        this.obscureText=false,
        this.hintStyle,
        this.color,
        this.onSubmitted,
        this.inputFormatters,
        this.labelStyle,
        this.autoFillHint,
        this.maxLines,
        this.onTap,
        this.borderRadius,
        this.vertical,
        this.textInputAction,
        this.label,
        this.titleStyle,
        this.style,
        this.width,
        this.onSaved,
        this.errorMessage,
        this.labelText,
        this.textAlign});

  final double? vertical;
  final String? hintText;
  final int? maxLength;
  final Widget? leading;
  final ValueChanged<String>? onChanged;
  final void Function(String?)? onSaved;
  final ValueChanged<String>? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final bool enabled;
  final int? maxLines;
  final TextEditingController? controller;
  final bool expands;
  final double? height;
  final double? width;

  final String? errorText;
  final Widget? trailingIcon;
  final TextInputType? keyboardType;
  final FocusNode? node;
  final bool obscureText;
  final TextStyle? hintStyle;
  final Color? color;
  final TextStyle? labelStyle;
  final TextStyle? titleStyle;
  final List<String>? autoFillHint;
  final VoidCallback? onTap;
  final double? borderRadius;
  final String? labelText;

  final TextInputAction? textInputAction;
  final String? label;
  final TextStyle? style;
  final TextAlign? textAlign;
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(label!,
              style: titleStyle ?? AppStyles.styleRegular14(context).copyWith(color: Colors.white)),
        const SizedBox(height: 10),
        SizedBox(
          height: height,
          width: width ?? size.width,
          child: TextFormField(

            textAlignVertical: TextAlignVertical.center,
            textDirection: TextDirection.rtl,
            style: style ??
                AppStyles.styleRegular14(context)
                    .copyWith(color: ColorsAsset.kDarkBrown),
            onTap: onTap,
            onTapOutside: (v) {
              FocusScope.of(context).unfocus();
            },
            textAlign: textAlign ?? TextAlign.start,
            cursorHeight: 15,
            maxLength: maxLength,

            enabled: enabled,
            obscureText: obscureText,
            textInputAction: textInputAction,
            cursorColor: ColorsAsset.kGreen,
             onSaved: onSaved,
            controller: controller,
            onChanged: onChanged,
            keyboardType: keyboardType,
            maxLines: maxLines ?? (expands ? null : 1),
            validator: validator ?? (value) {
              if (value!.isEmpty) {
                return errorMessage ?? null;
              }
              return null;
            },
            decoration: InputDecoration(
              labelText:  labelText,
              hintText: hintText,
              hintStyle: hintStyle ??
                  AppStyles.styleRegular14(context)
                      .copyWith(color: ColorsAsset.kDarkBrown),


              floatingLabelBehavior: FloatingLabelBehavior.never,
              fillColor: color ?? Colors.white,
              filled: true,
              prefixIcon: leading,
              suffixIconColor: ColorsAsset.kDarkBrown,

              suffixIcon: trailingIcon,




              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 10),
                borderSide:  BorderSide(
                  color: Colors.grey.shade200,
                  width: 0.5,
                ),

              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 10),
                borderSide:  BorderSide(
                  color: Colors.grey.shade200,
                  width: 0.5,
                ),

              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 10),
                borderSide:  BorderSide(
                  color: Colors.grey.shade200,
                  width: 0.5,
                ),

              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 10),
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 0.5,
                ),
              ),
              errorStyle: const TextStyle(color: Colors.red),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 10),
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 0.5,
                ),
              ),
              errorText: errorText,
              hintMaxLines: 1,
              alignLabelWithHint: true,
            ),
          ),
        ),
      ],
    );
  }
}
