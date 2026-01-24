import 'package:dio/dio.dart';
import 'package:docdoc/core/networking/api_constants.dart';
import 'package:docdoc/features/login/data/models/login_requst_body.dart';
import 'package:docdoc/features/login/data/models/login_response_body.dart';
import 'package:docdoc/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:docdoc/features/sign_up/data/models/sign_up_response_body.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;


  @POST(ApiConstants.loginEndpoint)
  Future<LoginResponseBody> login(@Body() LoginRequestBody loginRequestBody);

  @POST(ApiConstants.registerEndpoint)
  Future<SignUpResponseBody> signUp(
    @Body() SignUpRequestBody signUpRequestBody,
  );
}    