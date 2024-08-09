import 'package:dio/dio.dart';
import 'package:flutter_complete_project/core/networking/api_constant.dart';
import 'package:retrofit/retrofit.dart';

import '../models/sign_up_request_body.dart';
import '../models/sign_up_response.dart';
part 'signup_api.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class SignUpApi {
  factory SignUpApi(Dio dio, {String? baseUrl}) = _SignUpApi;

  @POST(ApiConstants.signup)
  Future<SignupResponse> signup(@Body() SignupRequestBody signRequestBody);
}