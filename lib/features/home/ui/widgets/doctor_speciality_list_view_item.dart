import 'package:docdoc/core/helpers/spacing.dart';
import 'package:docdoc/core/theme/colors.dart';
import 'package:docdoc/core/theme/styles.dart';
import 'package:docdoc/features/home/data/models/home_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecialityListViewItem extends StatelessWidget {
  final SpecializationsData? specialization;
  final int itemIndex;
  const DoctorSpecialityListViewItem({super.key,this.specialization ,required this.itemIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: EdgeInsetsDirectional.only(start: itemIndex == 0 ? 0 : 24.w),
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
                Text(specialization?.name ?? '', style: TextStyles.font12DarkBlueRegular),
              ],
            ),
          );
  }
}