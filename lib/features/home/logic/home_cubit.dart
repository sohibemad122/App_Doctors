import 'package:docdoc/core/helpers/extension.dart';
import 'package:docdoc/core/networking/api_error_handler.dart';
import 'package:docdoc/core/networking/api_result.dart';
import 'package:docdoc/features/home/data/models/home_response_model.dart';
import 'package:docdoc/features/home/data/repos/home_repo.dart';
import 'package:docdoc/features/home/logic/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(HomeState.initial());

  List<SpecializationsData?>? specializationsList = [];

  void getSpecializations() async {
    emit(HomeState.specializationLoading());
    final result = await _homeRepo.getSpecializations();

    result.when(
      success: (data) {
        specializationsList = data.specializationsData ?? [];

        getDoctorsList(specializationId: specializationsList?.first?.id);
        emit(HomeState.specializationSuccess(specializationsList));
      },
      failure: (error) {
        emit(HomeState.specializationError(error));
      },
    );
  }

  void getDoctorsList({required int? specializationId}) async {
    List<Doctors?>? specializationsDoctorsList = filterSpecializationsById(
      specializationId,
    );
    if (!specializationsDoctorsList.isNullOrEmpty()) {
      emit(HomeState.doctorsSuccess(specializationsDoctorsList));
    } else {
      emit(
        HomeState.doctorsError(
          ErrorHandler.handle('No doctors found for this specialization.'),
        ),
      );
    }
  }

  filterSpecializationsById(specializationId) {
    return specializationsList
        ?.firstWhere((specialization) => specialization?.id == specializationId)
        ?.doctors;
  }
}
