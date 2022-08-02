import 'package:appwrite/appwrite.dart';
import 'package:cars_appwrite/features/video/domain/use_case/video_use_case.dart';
import 'package:cars_appwrite/server/catch_exceptions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_state.dart';
part 'video_cubit.freezed.dart';

class VideoCubit extends Cubit<VideoState> {
  VideoCubit({required this.usecase}) : super(const VideoState.loading()) {
    getVideo();
  }
  final VideoUseCase usecase;

  getVideo() async {
    try {
      emit(VideoState.success(await usecase.getVideo()));
    } catch (error) {
      emit(VideoState.error(CatchException.convertException(error)));
    }
  }

  saveVideo(InputFile file) async {
    try {
      emit(const VideoState.loading());
      emit(VideoState.success(await usecase.saveVideo(file)));
    } catch (error) {
      emit(VideoState.error(CatchException.convertException(error)));
    }
  }
}
