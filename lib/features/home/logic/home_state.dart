import 'package:docdoc/core/networking/api_error_handler.dart';
import 'package:docdoc/features/home/data/models/home_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed

class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  //Specializations
  const factory HomeState.specializationLoading() = SpecializationLoading;
  const factory HomeState.specializationSuccess(
    List<SpecializationsData?>? specializationsData,
  ) = SpecializationSuccess;
  const factory HomeState.specializationError(ErrorHandler errorHandler) =
      SpecializationError;

  //Doctors

  const factory HomeState.doctorsSuccess(List<Doctors?>? doctorsData) =
      DoctorsSuccess;
  const factory HomeState.doctorsError(ErrorHandler errorHandler) =
      DoctorsError;
}
