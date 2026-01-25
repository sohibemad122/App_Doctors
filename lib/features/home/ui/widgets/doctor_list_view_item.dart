import 'package:docdoc/core/helpers/spacing.dart';
import 'package:docdoc/core/theme/styles.dart';
import 'package:docdoc/features/home/data/models/home_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorListViewItem extends StatelessWidget {
  final Doctors? doctors;
  const DoctorListViewItem({super.key, this.doctors});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      // decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(
               'assets/images/Doctor1.png',
              height: 120.h,
              width: 110.w,
              fit: BoxFit.cover,
            ),
          ),
          horizontalspace(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctors?.name ?? 'Dr. Stella Kane',
                  style: TextStyles.font18DarkBlueBold,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalspace(5),
                Text(
                 '${doctors?.degree} - ${doctors?.phone}',
                  style: TextStyles.font12GrayMedium,
                ),
                verticalspace(5),
                  Text(doctors?.email ?? 'email@example.com', style: TextStyles.font12GrayMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
