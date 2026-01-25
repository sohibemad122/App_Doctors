import 'package:dio/dio.dart';
import 'package:docdoc/features/home/data/apis/home_api_constants.dart';
import 'package:docdoc/features/home/data/models/home_response_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'home_api_service.g.dart';

@RestApi(baseUrl: HomeApiConstants.specializationEp)
abstract class HomeApiService {
  factory HomeApiService(Dio dio, {String baseUrl}) = _HomeApiService;

  @GET(HomeApiConstants.specializationEp)
  Future<HomeResponseModel> getSpecializations();
}
