part of 'fetch_treatment_list_bloc.dart';

@freezed
class FetchTreatmentListEvent with _$FetchTreatmentListEvent {
  const factory FetchTreatmentListEvent.started() = _Started;
  const factory FetchTreatmentListEvent.fetchTreatment() = _FetchTreatmentList;
}
