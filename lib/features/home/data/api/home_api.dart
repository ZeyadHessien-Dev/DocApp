
import 'package:dio/dio.dart';
import 'package:flutter_complete_project/features/home/data/model/doctors_response.dart';
import 'package:retrofit/http.dart';
import '../../../../core/networking/api_constant.dart';
part 'home_api.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class HomeApi {
  factory HomeApi(Dio dio) = _HomeApi;

  @GET(ApiConstants.specialization)
  Future<SpecializationsResponseModel> getSpecializationsData();
}
