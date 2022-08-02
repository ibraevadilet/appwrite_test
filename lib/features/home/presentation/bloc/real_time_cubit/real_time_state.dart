part of 'real_time_cubit.dart';

@freezed
class RealTimeState with _$RealTimeState {
  const factory RealTimeState.initial() = _Initial;
  const factory RealTimeState.loading() = _Loading;
  const factory RealTimeState.success(List<CarsEntity> model) = _Success;
  const factory RealTimeState.error(CatchException error) = _Error;
}
