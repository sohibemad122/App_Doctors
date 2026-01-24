import 'package:docdoc/core/helpers/spacing.dart';
import 'package:docdoc/core/theme/styles.dart';
import 'package:docdoc/core/widgets/app_text_button.dart';
import 'package:docdoc/features/login/logic/login_cubit.dart';
import 'package:docdoc/features/login/ui/widgets/already_have_account_text.dart';
import 'package:docdoc/features/login/ui/widgets/email_and_password.dart';
import 'package:docdoc/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:docdoc/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcome Back', style: TextStyles.font24BlueBold),
                verticalspace(8),
                Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: TextStyles.font14GrayRegular,
                ),
                verticalspace(36),
                Column(
                  children: [
                    const EmailAndPassword(),
                    verticalspace(24),

                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        'Forget Password?',
                        style: TextStyles.font13BlueRegular,
                      ),
                    ),
                    verticalspace(40),
                    AppTextButton(
                      buttonText: 'login',
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        valdateThenDoLogin(context);
                      },
                    ),
                    verticalspace(16),
                    TermsAndConditionsText(),
                    verticalspace(60),

                    DontHaveAccountText(),
                    const LoginBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void valdateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formkey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginLoading();
    }
  }
}
