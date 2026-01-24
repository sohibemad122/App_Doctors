import 'package:docdoc/core/networking/api_error_handler.dart';
import 'package:docdoc/core/networking/api_result.dart';
import 'package:docdoc/core/networking/api_services.dart';
import 'package:docdoc/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:docdoc/features/sign_up/data/models/sign_up_response_body.dart';

class SignUpRepo {
  final ApiServices _apiServices;

  SignUpRepo(this._apiServices);

  Future<ApiResult<SignUpResponseBody>> signUp(
    SignUpRequestBody signUpRequestBody,
  ) async {
    try {
      final response = await _apiServices.signUp(signUpRequestBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
