part of 'fetch_treatment_list_bloc.dart';

@freezed
class FetchTreatmentListState with _$FetchTreatmentListState {
  const factory FetchTreatmentListState.initial() = _Initial;

  const factory FetchTreatmentListState.loading() = _Loading;
  const factory FetchTreatmentListState.FetchTreatmentListSuccess(
          {required List<TreatmentListModel> treatmentListModel}) =
      _TreatmentListSuccess;
  const factory FetchTreatmentListState.noInternet() = _NoInternet;
  const factory FetchTreatmentListState.Failure({required String error}) =
      FetchTreatmentFailure;
}
