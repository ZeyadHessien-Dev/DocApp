import 'package:flutter_complete_project/core/networking/api_result.dart';
import 'package:flutter_complete_project/core/networking/error/api_error_handler.dart';
import 'package:flutter_complete_project/features/home/data/api/home_api.dart';
import 'package:flutter_complete_project/features/home/data/model/doctors_response.dart';

class HomeRepo {
  final HomeApi _homeApi;
  HomeRepo(this._homeApi);

  Future<ApiResult<SpecializationsResponseModel>> getSpecializations() async {
    try {
      final response = await _homeApi.getSpecializationsData();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }

  }

}