part of 'video_cubit.dart';

@freezed
class VideoState with _$VideoState {
  const factory VideoState.loading() = _Loading;
  const factory VideoState.success(List<String> ids) = _Success;
  const factory VideoState.error(CatchException error) = _Error;
}
