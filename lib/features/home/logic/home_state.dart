import 'package:flutter_complete_project/features/home/data/model/doctors_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/networking/error/api_error_model.dart';
part 'home_state.freezed.dart';
@Freezed()
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.specializationsLoading() = SpecializationsLoading;
  const factory HomeState.specializationsSuccess(List<SpecializationsData?>? specializationsList) = SpecializationsSuccess;
  const factory HomeState.specializationsError(ApiErrorModel apiError) = SpecializationsError;

  const factory HomeState.doctorsSuccess(List<Doctors?>? doctors) = DoctorsSuccess;
  const factory HomeState.doctorsError(String error) = DoctorsError;
}