import 'package:docdoc/core/di/dependency_injection.dart';
import 'package:docdoc/core/helpers/constans.dart';
import 'package:docdoc/core/helpers/extension.dart';
import 'package:docdoc/core/helpers/shared_pref_helber.dart';
import 'package:docdoc/core/routing/app_router.dart';
import 'package:docdoc/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencyInjection();
  await ScreenUtil.ensureScreenSize();
  await checkIfLoggedInUser();

  runApp(DocApp(appRouter: AppRouter()));
}

checkIfLoggedInUser() async {
  String? userToken = await SharedPrefHelper.getString(
    SharedPreferencesKeys.userToken,
  );
  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
