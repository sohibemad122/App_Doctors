import 'package:docdoc/core/helpers/spacing.dart';
import 'package:docdoc/core/theme/colors.dart';
import 'package:docdoc/core/theme/styles.dart';
import 'package:flutter/material.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowercase;
  final bool hasUppercase;
  final bool hasSpecialChar;
  final bool hasMinLength;
  final bool hasNumber;
  const PasswordValidations({
    super.key,
    required this.hasLowercase,
    required this.hasUppercase,
    required this.hasSpecialChar,
    required this.hasMinLength,
    required this.hasNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ValidationRow('At least one lowercase letter', hasLowercase),
        verticalspace(2),
        ValidationRow('At least one uppercase letter', hasUppercase),
        verticalspace(2),
        ValidationRow('At least one number', hasNumber),
        verticalspace(2),
        ValidationRow('At least one special character', hasSpecialChar),
        verticalspace(2),
        ValidationRow('Minimum 8 characters', hasMinLength),
      ],
    );
  }

  Widget ValidationRow(String text, bool isValid) {
    return Row(
      children: [
        const CircleAvatar(radius: 4, backgroundColor: ColorsManager.gery),
        horizontalspace(6),
        Text(
          text,
          style: TextStyles.font13DarkBlueRegular.copyWith(
            decoration: isValid ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 2,
            color: isValid ? ColorsManager.gery : ColorsManager.darkBlue,
          ),
        ),
      ],
    );
  }
}
