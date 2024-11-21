
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:noviindus_interview/core/model/branch_list_model/branch_list_model.dart';
import 'package:noviindus_interview/core/services/auth/auth_services.dart';

part 'fetch_branch_list_event.dart';
part 'fetch_branch_list_state.dart';
part 'fetch_branch_list_bloc.freezed.dart';

class FetchBranchListBloc
    extends Bloc<FetchBranchListEvent, FetchBranchListState> {
  FetchBranchListBloc() : super(_Initial()) {
    on<_FetchBranchList>((event, emit) async {
      emit(const FetchBranchListState.loading());
      final response = await AuthServices().fetchBranchList();

      response.fold((failure) {
        if (failure == "No Internet") {
          emit(const FetchBranchListState.noInternet());
        } else {
          emit(FetchBranchListState.Failure(error: failure.toString()));
        }
      }, (success) {
        emit(FetchBranchListState.FetchBranchLisSuccess(
          branchlistmodel: success,
        ));
      });
    });
  }
}
