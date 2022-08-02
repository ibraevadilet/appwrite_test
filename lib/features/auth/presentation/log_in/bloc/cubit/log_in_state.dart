part of 'log_in_cubit.dart';

@freezed
class LogInState with _$LogInState {
  const factory LogInState.initial() = _Initial;
  const factory LogInState.loading() = _Loadig;
  const factory LogInState.success() = _Success;
  const factory LogInState.error(CatchException error) = _Error;
}
