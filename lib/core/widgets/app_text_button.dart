import 'package:docdoc/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButton extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundColor;
  final double? horizontalpadding;
  final double? verticalpadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final String buttonText;
  final TextStyle textStyle;
  final VoidCallback onPressed;

  const AppTextButton({
    super.key,
    this.borderRadius,
    this.backgroundColor,
    this.horizontalpadding,
    this.verticalpadding,
    this.buttonWidth,
    this.buttonHeight,
    required this.buttonText,
    required this.textStyle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        // ignore: deprecated_member_use
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 16.0),
          ),
        ),
        // ignore: deprecated_member_use
        backgroundColor: MaterialStatePropertyAll(
          backgroundColor ?? ColorsManager.mainBlue,
        ),
        // ignore: deprecated_member_use
        padding: MaterialStateProperty.all<EdgeInsets>(
          EdgeInsets.symmetric(
            vertical: verticalpadding?.h ?? 12.h,
            horizontal: horizontalpadding?.w ?? 14.w,
          ),
        ),
        // ignore: deprecated_member_use
        fixedSize: MaterialStateProperty.all(
          Size(buttonWidth?.w ?? double.maxFinite, buttonHeight?.h ?? 55.h),
        ),
      ),

      onPressed: onPressed,
      child: Text(
      buttonText,
      style: textStyle,
        
      ),
    );
  }
}
