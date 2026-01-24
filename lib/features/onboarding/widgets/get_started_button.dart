import 'package:docdoc/core/helpers/extension.dart';
import 'package:docdoc/core/routing/routes.dart';
import 'package:docdoc/core/theme/colors.dart';
import 'package:docdoc/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52.h,
      width: 311.w,
      child: TextButton(
        onPressed: () => context.pushNamed(Routes.loginScreen),
        style: ButtonStyle(
          // ignore: deprecated_member_use
          backgroundColor: MaterialStateProperty.all(ColorsManager.mainBlue),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          // ignore: deprecated_member_use
          maximumSize: MaterialStateProperty.all(Size(double.infinity, 52)),
          // ignore: deprecated_member_use
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
        ),

        child: Text('Get Started', style: TextStyles.font16WhiteSemiBold),
      ),
    );
  }
}
