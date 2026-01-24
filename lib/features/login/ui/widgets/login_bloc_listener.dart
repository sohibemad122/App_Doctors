import 'package:docdoc/core/helpers/extension.dart';
import 'package:docdoc/core/routing/routes.dart';
import 'package:docdoc/core/theme/colors.dart';
import 'package:docdoc/features/login/logic/login_cubit.dart';
import 'package:docdoc/features/login/logic/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(color: ColorsManager.mainBlue),
              ),
            );
          },
          success: (loginResponse) {
            context.pop();
            context.pushNamed(Routes.homeScreen);
          },
          failure: (errorMessage) {
            context.pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage),
                backgroundColor: ColorsManager.mainBlue,
              ),
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
