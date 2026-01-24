import 'package:docdoc/core/networking/api_error_handler.dart';
import 'package:docdoc/core/networking/api_result.dart';
import 'package:docdoc/features/home/data/apis/home_api_service.dart';
import 'package:docdoc/features/home/data/models/home_response_model.dart';

class HomeRepo {
  final HomeApiService homeApiService;
  HomeRepo(this.homeApiService);

  Future<ApiResult<HomeResponseModel>> getHomeData() async {
    try {
      final response = await homeApiService.getHomeDate();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}