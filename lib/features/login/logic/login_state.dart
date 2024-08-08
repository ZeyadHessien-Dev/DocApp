part of 'login_cubit.dart';

@freezed
class LoginState<T> with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loginLoading() = Loading;
  const factory LoginState.loginSuccess(T data) = Success<T>;
  const factory LoginState.loginError(ApiErrorModel apiError) = Error;
}
