import 'package:cars_appwrite/features/home/domain/use_case/real_time_use_case.dart';
import 'package:cars_appwrite/features/load_files/domain/cars_entity/cars_entity.dart';
import 'package:cars_appwrite/server/catch_exceptions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'real_time_state.dart';
part 'real_time_cubit.freezed.dart';

class RealTimeCubit extends Cubit<RealTimeState> {
  RealTimeCubit({required this.usecase})
      : super(const RealTimeState.initial()) {
    realTime();
  }
  final RealTimeUseCase usecase;

  realTime() {
    try {
      usecase.realTime().listen(
        (data) {
          emit(const RealTimeState.loading());
          if (data.isNotEmpty) {
            emit(RealTimeState.success(data));
          } else {
            emit(const RealTimeState.success([]));
          }
        },
      );
    } catch (error) {
      emit(RealTimeState.error(CatchException.convertException(error)));
    }
  }
}
