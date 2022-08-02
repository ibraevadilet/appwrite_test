part of 'load_data_cubit.dart';

@freezed
class LoadDataState with _$LoadDataState {
  const factory LoadDataState.initial() = _Initial;
  const factory LoadDataState.loading() = _Loadig;
  const factory LoadDataState.success(List<CarsEntity> model) = _Success;
  const factory LoadDataState.error(CatchException error) = _Error;
}
