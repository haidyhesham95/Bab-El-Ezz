import 'package:bab_el_ezz/shared_utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../styles/text.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget(
      {super.key,
      this.onChanged,
      this.maxLength,
      this.hint,
      this.leading,
      this.validator,
      this.enabled = true,
      this.controller,
      this.initialText,
      this.expands = false,
      this.height,
      this.errorText,
      this.trailingIcon,
      this.keyboardType,
      this.node,
      this.isPassword = false,
      this.hintStyle,
      this.color,
      this.onSubmitted,
      this.inputFormatters,
      this.labelStyle,
      this.autoFillHint,
      this.maxLines,
      this.onTap,
      this.isDense = false,
      this.borderRadius,
      this.enabledBorderColor,
      this.focusedBorderColor,
      this.contentPadding,
      this.vertical,
      this.textInputAction,
      this.titlePadding,
      this.label,
      this.readOnly,
      this.titleStyle,
      this.style,
      this.width,
      this.onSaved,
      this.textAlign});

  final double? vertical;
  final String? hint;
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
  final String? initialText;
  final bool expands;
  final double? height;
  final double? width;

  final String? errorText;
  final Widget? trailingIcon;
  final TextInputType? keyboardType;
  final FocusNode? node;
  final bool isPassword;
  final TextStyle? hintStyle;
  final Color? color;
  final TextStyle? labelStyle;
  final TextStyle? titleStyle;
  final List<String>? autoFillHint;
  final VoidCallback? onTap;
  final bool isDense;
  final double? borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final TextInputAction? textInputAction;
  final EdgeInsetsGeometry? titlePadding;
  final bool? readOnly;
  final String? label;
  final TextStyle? style;
  final TextAlign? textAlign;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Text(widget.label!,
              style: widget.titleStyle ?? AppStyles.styleRegular14(context)),
        SizedBox(height: 10),
        SizedBox(
          height: widget.height ?? size.height * 0.06,
          width: widget.width,
          child: TextFormField(
            textAlignVertical: TextAlignVertical.center,
            style: widget.style ??
                AppStyles.styleRegular14(context)
                    .copyWith(color: ColorsAsset.kDarkBrown),
            onTap: widget.onTap,
            onTapOutside: (v) {
              FocusScope.of(context).unfocus();
            },
            textAlign: widget.textAlign ?? TextAlign.start,
            cursorHeight: 15,
            onSaved: widget.onSaved,
            maxLength: widget.maxLength,
            autofillHints: widget.autoFillHint,
            key: widget.key,
            readOnly: widget.readOnly ?? false,
            onEditingComplete: () {
              widget.node?.unfocus();
              FocusScope.of(context).unfocus();
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onFieldSubmitted: widget.onSubmitted,
            focusNode: widget.node,
            keyboardType: widget.keyboardType ??
                (widget.expands ? TextInputType.multiline : TextInputType.text),
            validator: widget.validator,
            inputFormatters: widget.inputFormatters,
            enabled: widget.enabled,
            obscureText: widget.isPassword,
            textInputAction: widget.textInputAction,
            cursorColor: ColorsAsset.kGreen,
            controller: widget.controller,
            initialValue: widget.initialText,
            onChanged: widget.onChanged,
            maxLines: widget.maxLines ?? (widget.expands ? null : 1),
            decoration: InputDecoration(
              // contentPadding: widget.contentPadding ??
              //     EdgeInsetsDirectional.symmetric(
              //       horizontal: 20,
              //       vertical: widget.vertical ?? 20,
              //     ),
              isDense: widget.isDense,
              labelStyle: widget.labelStyle,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              fillColor: widget.color ?? Colors.white,
              filled: true,
              prefixIcon: widget.leading,
              suffixIconColor: ColorsAsset.kDarkBrown,

              suffixIcon: widget.trailingIcon != null
                  ? Padding(
                      padding: const EdgeInsets.all(15),
                      child: widget.trailingIcon,
                    )
                  : null,
              hintText: widget.hint,

              hintStyle: widget.hintStyle ??
                  AppStyles.styleRegular14(context)
                      .copyWith(color: ColorsAsset.kDarkBrown),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
                // borderSide: BorderSide(
                //   color: widget.enabledBorderColor ??
                //       ColorsAsset.kDarkGray,
                //   width: 1.5,
                // ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
                // borderSide: BorderSide(
                //  color: widget.focusedBorderColor ??
                //      ColorsAsset.kDarkGray,
                //
                //   width: 1.5,
                // ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
                // borderSide: BorderSide(
                //   color: widget.enabledBorderColor ??
                //       ColorsAsset.kDarkGray,
                //   width: 1,
                // ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1,
                ),
              ),
              errorStyle: const TextStyle(color: Colors.red),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1,
                ),
              ),
              errorText: widget.errorText,
              hintMaxLines: 2,
              alignLabelWithHint: true,
            ),
          ),
        ),
      ],
    );
  }
}
