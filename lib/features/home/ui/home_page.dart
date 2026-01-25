import 'package:docdoc/core/helpers/spacing.dart';
import 'package:docdoc/features/home/logic/home_cubit.dart';
import 'package:docdoc/features/home/logic/home_state.dart';
import 'package:docdoc/features/home/ui/widgets/doctor_blue_container.dart';
import 'package:docdoc/features/home/ui/widgets/doctor_list_view.dart';
import 'package:docdoc/features/home/ui/widgets/doctor_speciality_and_see_all.dart';
import 'package:docdoc/features/home/ui/widgets/doctor_speciality_list_view.dart';
import 'package:docdoc/features/home/ui/widgets/home_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              BlocBuilder<HomeCubit, HomeState>(
                buildWhen: (previous, current) =>
                    current is SpecializationLoading ||
                    current is SpecializationSuccess ||
                    current is SpecializationError,
                builder: (context, state) {
                  return state.maybeWhen(
                    specializationLoading: () {
                      return const SizedBox(
                        height: 100,
                        child: Center(child: CircularProgressIndicator()),
                      );
                    },
                    specializationSuccess: (homeresponsemodel) {
                      var specializationsList =
                          homeresponsemodel.specializationsData;
                      return Expanded(
                        child: Column(
                          children: [
                            DoctorSpecialityListView(
                              specializationsList: specializationsList ?? [],
                            ),
                            verticalspace(15.h),
                            DoctorListView(
                              doctorsList: specializationsList?[0]?.doctors,
                            ),
                          ],
                        ),
                      );
                    },
                    specializationError: (errorHandler) {
                      return const SizedBox.shrink();
                    },
                    orElse: () {
                      return const SizedBox.shrink();
                    },
                  );
                },
              ),

              // const DoctorSpecialityListView(),
              // verticalspace(15.h),
              // const DoctorListView(),
            ],
          ),
        ),
      ),
    );
  }
}
