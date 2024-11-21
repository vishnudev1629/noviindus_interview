part of 'fetch_patient_list_bloc.dart';

@freezed
class FetchPatientListEvent with _$FetchPatientListEvent {
  const factory FetchPatientListEvent.started() = _Started;
  const factory FetchPatientListEvent.fetchPatient() = _FetchPatientList;
}
