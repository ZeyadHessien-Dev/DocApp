import 'package:flutter_complete_project/core/networking/api_result.dart';
import 'package:flutter_complete_project/features/sign_up/data/api/signup_api.dart';
import 'package:flutter_complete_project/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:flutter_complete_project/features/sign_up/data/models/sign_up_response.dart';
import '../../../../core/networking/error/api_error_handler.dart';

class SignupRepo {
  final SignUpApi _apiService;

  SignupRepo(this._apiService);

  Future<ApiResult<SignupResponse>> signup(SignupRequestBody signupRequestBody) async {
    try {
      final response = await _apiService.signup(signupRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}