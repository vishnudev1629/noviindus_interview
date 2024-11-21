part of 'fetch_branch_list_bloc.dart';

@freezed
class FetchBranchListState with _$FetchBranchListState {
  const factory FetchBranchListState.initial() = _Initial;
  const factory FetchBranchListState.loading() = _Loading;
  const factory FetchBranchListState.FetchBranchLisSuccess(
          {required List<BranchListModel> branchlistmodel}) =
      _FetchBranchListSuccess;
  const factory FetchBranchListState.noInternet() = _NoInternet;
  const factory FetchBranchListState.Failure({required String error}) =
      FetchBranchFailure;
}
