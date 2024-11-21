
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:noviindus_interview/core/model/treatment_list_model/treatment_list_model.dart';
import 'package:noviindus_interview/core/services/auth/auth_services.dart';

part 'fetch_treatment_list_event.dart';
part 'fetch_treatment_list_state.dart';
part 'fetch_treatment_list_bloc.freezed.dart';

class FetchTreatmentListBloc
    extends Bloc<FetchTreatmentListEvent, FetchTreatmentListState> {
  FetchTreatmentListBloc() : super(_Initial()) {
    on<_FetchTreatmentList>((event, emit) async {
      emit(const FetchTreatmentListState.loading());
      final response = await AuthServices().fetchTreatmentList();

      response.fold((failure) {
        if (failure == "No Internet") {
          emit(const FetchTreatmentListState.noInternet());
        } else {
          emit(FetchTreatmentListState.Failure(error: failure.toString()));
        }
      }, (success) {
        emit(FetchTreatmentListState.FetchTreatmentListSuccess(
          treatmentListModel: success,
        ));
      });
    });
  }
}
