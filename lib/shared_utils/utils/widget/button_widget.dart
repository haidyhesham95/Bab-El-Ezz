

import 'package:bab_el_ezz/shared_utils/styles/colors.dart';
import 'package:bab_el_ezz/shared_utils/styles/text.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    this.onPressed,
    this.color,
    this.text,
    this.textColor = Colors.white,
    this.height,
    this.width,
    this.child,
    this.borderColor,
    this.hasElevation = false,
    this.loading = false,
    this.loadingColor,
    this.borderRadius = 10,
    this.fontStyle,
    this.decorationColor,
    this.margin,
    this.padding,
  }) : assert(child != null || text != null);
  final Function()? onPressed;
  final Color? color;
  final String? text;
  final double? height;
  final double? width;
  final Widget? child;
  final Color? borderColor;
  final Color textColor;
  final bool hasElevation;
  final bool loading;
  final Color? loadingColor;
  final Color? decorationColor;
  final double borderRadius;
  final TextStyle? fontStyle;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      decoration: BoxDecoration(
          color: decorationColor,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            if (hasElevation)
              BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 2,
                spreadRadius: 0,
                color: ColorsAsset.kGreen.withOpacity(0.5),
              )
          ]),
      child: MaterialButton(
     //   height: height,

        elevation: 0,
        onPressed: onPressed,
        color: loading ? ColorsAsset.kGreen : color ?? ColorsAsset.kGreen,
        disabledTextColor: Colors.red,
       // minWidth: width ?? MediaQuery.sizeOf(context).width,
      //  height: height ?? 40,

        disabledColor: color ?? ColorsAsset.kGreen,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ),
          side: borderColor != null
              ? BorderSide(
            color: borderColor!,
          )
              : BorderSide.none,
        ),
        splashColor: color,
        focusColor: color,
        highlightColor: color,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
       // padding: padding ?? const EdgeInsets.symmetric(horizontal: 12),
        child: loading
            ? SizedBox(
          width: width,
          height: height,
          child: Center(
            child: CircularProgressIndicator(
              color: loadingColor ?? Colors.white,
            ),
          ),
        )
            : text != null
            ? Center(
              child: Text(
          text!,
          style: fontStyle ??
                AppStyles.styleBold16(context).copyWith(
                  color: textColor,
                  height: 1,
                ),
        ),
            )
            : child,
      ),
    );
  }
}