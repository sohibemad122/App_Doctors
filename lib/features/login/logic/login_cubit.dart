import 'package:docdoc/core/helpers/constans.dart';
import 'package:docdoc/core/helpers/shared_pref_helber.dart';
import 'package:docdoc/core/networking/api_result.dart';
import 'package:docdoc/features/login/data/models/login_requst_body.dart';
import 'package:docdoc/features/login/data/repos/login_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:docdoc/features/login/logic/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  void emitLoginLoading() async {
    emit(const LoginState.loading());
    final result = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    result.when(
      success: (loginResponse) async {
        await saveUserToken(loginResponse.userDate?.token ?? '');

        emit(LoginState.success(loginResponse));
      },
      failure: (error) {
        emit(LoginState.failure(errorMessage: error.failure.message ?? ''));
      },
    );
  }

  Future saveUserToken(String token) async {
    await SharedPrefHelper.setSecureString(SharedPreferencesKeys.userToken, token);
  }
}
