import 'package:docdoc/core/networking/api_result.dart';
import 'package:docdoc/features/home/data/repos/home_repo.dart';
import 'package:docdoc/features/home/logic/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;
  HomeCubit(this.homeRepo) : super(HomeState.initial());

  void getSpecializations() async{
    emit(HomeState.specializationLoading());
    final result = await homeRepo.getHomeData();

    result.when(
        success: (data) {
          emit(HomeState.specializationSuccess(data));
        },
        failure: (error) {
          emit(HomeState.specializationError(error));
        }
    );
}
}