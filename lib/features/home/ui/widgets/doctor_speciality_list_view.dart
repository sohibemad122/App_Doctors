import 'package:docdoc/core/helpers/spacing.dart';
import 'package:docdoc/core/theme/colors.dart';
import 'package:docdoc/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecialityListView extends StatelessWidget {
  const DoctorSpecialityListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 24.w),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: ColorsManager.lightBlue,
                  child: Image.asset(
                    'assets/images/Man1.png',
                    height: 40.h,
                    width: 40.w,
                  ),
                ),
                verticalspace(8),
                Text('Cardiologist', style: TextStyles.font12DarkBlueRegular),
              ],
            ),
          );
        },
      ),
    );
  }
}
