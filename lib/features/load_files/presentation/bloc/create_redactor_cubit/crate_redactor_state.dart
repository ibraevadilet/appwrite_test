part of 'crate_redactor_cubit.dart';

@freezed
class CrateRedactorState with _$CrateRedactorState {
  const factory CrateRedactorState.initial() = _Initial;
    const factory CrateRedactorState.loading() = _Loadig;
  const factory CrateRedactorState.success() = _Success;
  const factory CrateRedactorState.error(CatchException error) = _Error;
}
