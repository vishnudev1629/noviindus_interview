part of 'fetch_patient_list_bloc.dart';

@freezed
class FetchPatientListState with _$FetchPatientListState {
  const factory FetchPatientListState.initial() = _Initial;
  const factory FetchPatientListState.loading() = _Loading;
  const factory FetchPatientListState.FetchPatientListSuccess(
      {required List<PatientListModel> loginModel}) = _LoginSuccess;
  const factory FetchPatientListState.noInternet() = _NoInternet;
  const factory FetchPatientListState.Failure({required String error}) =
      FetchPatientFailure;
}
