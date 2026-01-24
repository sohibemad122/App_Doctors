import 'package:docdoc/core/helpers/spacing.dart';
import 'package:docdoc/features/home/ui/widgets/doctor_blue_container.dart';
import 'package:docdoc/features/home/ui/widgets/doctor_list_view.dart';
import 'package:docdoc/features/home/ui/widgets/doctor_speciality_and_see_all.dart';
import 'package:docdoc/features/home/ui/widgets/doctor_speciality_list_view.dart';
import 'package:docdoc/features/home/ui/widgets/home_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(20, 16, 20, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const HomeTopBar(),
              verticalspace(18.h),
              const DoctorBlueContainer(),
              verticalspace(18.h),
              const DoctorSpecialityAndSeeAll(),
              verticalspace(15.h),
              
              const DoctorSpecialityListView(),
              verticalspace(15.h),
              const DoctorListView(),
            ],
          ),
        ),
      ),
    );
  }
}
