part of 'sign_in_cubit.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState.initial() = _Initial;
  const factory SignInState.loading() = _Loadig;
  const factory SignInState.success() = _Success;
  const factory SignInState.error(CatchException error) = _Error;
}
