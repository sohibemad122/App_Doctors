import 'package:docdoc/core/helpers/spacing.dart';
import 'package:docdoc/features/home/ui/widgets/doctor_blue_container.dart';
import 'package:docdoc/features/home/ui/widgets/doctor_speciality_and_see_all.dart';
import 'package:docdoc/features/home/ui/widgets/doctors_bloc_builder.dart';
import 'package:docdoc/features/home/ui/widgets/home_top_bar.dart';
import 'package:docdoc/features/home/ui/widgets/speciallizations_and_doctors_bloc_builder.dart';
import 'package:flutter/material.dart';

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
              const DoctorBlueContainer(),
              verticalspace(18),
              const DoctorSpecialityAndSeeAll(),
              verticalspace(15),
              SpeciallizationsBlocBuilder(),
              verticalspace(15),
              const DoctorsBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
