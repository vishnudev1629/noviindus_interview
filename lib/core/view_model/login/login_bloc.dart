
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:noviindus_interview/core/services/auth/auth_services.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(_Initial()) {
    AuthServices apiServices = AuthServices();
    on<_LoginRequested>((event, emit) async {
      emit(const LoginState.loading());

      try {
        final result = await apiServices.login(
          username: event.username,
          password: event.password,
        );

        await result.fold((failure) async {
          print('${failure.toString()}');
          emit(LoginState.loginFailure(error: failure.toString()));
        }, (success) async {
          print('${success.toString()}');
          // var accessToken = await SetSharedPreferences.storeAccessToken(
          //         success.misc.accessToken) ??
          //     'Access Token empty';
          emit(LoginState.loginSuccess(loginModel: success));
        });
      } catch (e) {
        emit(LoginState.loginFailure(error: 'An error occurred: $e'));
      }
    });
  }
}
