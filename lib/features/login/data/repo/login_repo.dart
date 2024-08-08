import 'package:flutter_complete_project/core/networking/error/api_error_handler.dart';

import '../../../../core/networking/api_result.dart';
import '../api/login_api.dart';
import '../model/login_request_body.dart';
import '../model/login_response.dart';

class LoginRepo {
  final LoginApi loginApi;
  LoginRepo(this.loginApi);

  Future<ApiResult<LoginResponse>> login(LoginRequestBody loginRequestBody) async {
    try {
      final response = await loginApi.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}