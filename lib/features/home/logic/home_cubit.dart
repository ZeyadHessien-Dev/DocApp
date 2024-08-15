import "package:bloc/bloc.dart";
import 'package:flutter_complete_project/features/home/data/model/doctors_response.dart';
import 'package:flutter_complete_project/features/home/data/repo/home_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  List<SpecializationsData?>? specializationDataList = [];
  void getSpecializations() async {
    emit(const HomeState.specializationsLoading());
    final response = await _homeRepo.getSpecializations();
    response.when(success: (specializations) {
      specializationDataList = specializations.specializationDataList ?? [];
      getDoctors(specializationId:  specializationDataList?.first?.id);
      emit(HomeState.specializationsSuccess(specializationDataList));
    }, failure: (error) {
      emit(HomeState.specializationsError(error));
    });
  }

  void getDoctors({int? specializationId}) {
    try {
      final List<Doctors?>? doctors = _filterDoctors(specializationId:  specializationId);
      emit(HomeState.doctorsSuccess(doctors ?? []));
    } catch (error) {
      emit(const HomeState.doctorsError('No Doctor Founded'));
    }

  }

  _filterDoctors({int? specializationId}) {
    return specializationDataList
        ?.firstWhere((element) => element?.id == specializationId)
        ?.doctorsList;
  }
}
