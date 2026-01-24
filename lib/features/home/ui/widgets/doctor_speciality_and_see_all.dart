import 'package:docdoc/core/theme/styles.dart';
import 'package:flutter/material.dart';

class DoctorSpecialityAndSeeAll extends StatelessWidget {
  const DoctorSpecialityAndSeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Doctor Speciality', style: TextStyles.font18DarkBlueSemiBold),
        const Spacer(),
        Text('See All', style: TextStyles.font12BlueRegular),
      ],
    );
  }
}
