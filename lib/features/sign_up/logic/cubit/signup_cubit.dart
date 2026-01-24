import 'package:docdoc/core/networking/api_result.dart';
import 'package:docdoc/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:docdoc/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:docdoc/features/sign_up/logic/cubit/signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignUpRepo _signUpRepo;
  SignupCubit(this._signUpRepo) : super(SignupState.initial());
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  final formkey = GlobalKey<FormState>();

  void emitSignUpState() async {
    emit(SignupState.loading());
    final response = await _signUpRepo.signUp(
      SignUpRequestBody(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        passwordConfirmation: passwordConfirmationController.text,
        gender: 0,
      ),
    );
    response.when(
      success: (signUpResponseBody) {
        emit(SignupState.success(signUpResponseBody));
      },
      failure: (error) {
        emit(SignupState.failure(errorMessage: error.failure.message ?? ''));
      },
    );
  }
}
