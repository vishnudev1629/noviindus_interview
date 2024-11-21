
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:noviindus_interview/core/model/patient_list_model/patient_list_model.dart';
import 'package:noviindus_interview/core/services/auth/auth_services.dart';

part 'fetch_patient_list_event.dart';
part 'fetch_patient_list_state.dart';
part 'fetch_patient_list_bloc.freezed.dart';

class FetchPatientListBloc
    extends Bloc<FetchPatientListEvent, FetchPatientListState> {
  FetchPatientListBloc() : super(_Initial()) {
    on<_FetchPatientList>((event, emit) async {
      emit(const FetchPatientListState.loading());
      final response = await AuthServices().fetchPatientList();

      response.fold((failure) {
        if (failure == "No Internet") {
          emit(const FetchPatientListState.noInternet());
        } else {
          emit(FetchPatientListState.Failure(error: failure.toString()));
        }
      }, (success) {
        emit(FetchPatientListState.FetchPatientListSuccess(
          loginModel: success,
        ));
      });
    });
  }
}
