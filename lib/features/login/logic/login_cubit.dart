import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_complete_project/core/networking/error/api_error_model.dart';
import 'package:flutter_complete_project/features/login/data/repo/login_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/model/login_request_body.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();


  void emitLogin() async {
    emit(const LoginState.loginLoading());
    final response = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    response.when(
      success: (loginResponse) {
        emit(LoginState.loginSuccess(loginResponse));
      },
      failure: (failure) {
        emit(LoginState.loginError(failure));
      },
    );
  }
}
