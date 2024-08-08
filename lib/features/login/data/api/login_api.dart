import 'package:dio/dio.dart';
import 'package:flutter_complete_project/core/networking/api_constant.dart';
import 'package:flutter_complete_project/features/login/data/model/login_request_body.dart';
import 'package:flutter_complete_project/features/login/data/model/login_response.dart';
import 'package:retrofit/retrofit.dart';
part 'login_api.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class LoginApi {
  factory LoginApi(Dio dio, {String? baseUrl}) = _LoginApi;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);
}