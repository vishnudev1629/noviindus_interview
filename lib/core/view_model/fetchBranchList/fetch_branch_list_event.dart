part of 'fetch_branch_list_bloc.dart';

@freezed
class FetchBranchListEvent with _$FetchBranchListEvent {
  const factory FetchBranchListEvent.started() = _Started;
  const factory FetchBranchListEvent.fetchBranch() = _FetchBranchList;
}
