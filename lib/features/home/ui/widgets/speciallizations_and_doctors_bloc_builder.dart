import 'package:docdoc/core/helpers/spacing.dart';
import 'package:docdoc/features/home/logic/home_cubit.dart';
import 'package:docdoc/features/home/logic/home_state.dart';
import 'package:docdoc/features/home/ui/widgets/doctor_speciality_list_view.dart';
import 'package:docdoc/features/home/ui/widgets/doctors_shimmer_loading.dart';
import 'package:docdoc/features/home/ui/widgets/spiciallization_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpeciallizationsBlocBuilder extends StatelessWidget {
  const SpeciallizationsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is SpecializationLoading ||
          current is SpecializationSuccess ||
          current is SpecializationError,
      builder: (context, state) {
        return state.maybeWhen(
          specializationLoading: () {
            return setupLoading();
          },
          specializationSuccess: (specializationsData) {
            var specializationsList = specializationsData;
            return setupSuccess(specializationsList);
          },
          specializationError: (errorHandler) => setupError(),
          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }

  Widget setupLoading() {
    return Expanded(child: Column(children: [
      const SpecialityShimmerLoading(),
      verticalspace(8),
      const DoctorsShimmerLoading()
      ]));
  }

  Widget setupSuccess(specializationsList) {
    return SpecialityListView(specializationsList: specializationsList ?? []);
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
