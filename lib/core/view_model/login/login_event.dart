part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.started() = _Started;
  const factory LoginEvent.loginRequested({
    required String username,
    required String password,
  }) = _LoginRequested;
}
