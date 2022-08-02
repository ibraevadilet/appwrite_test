import 'package:cars_appwrite/features/load_files/domain/cars_entity/cars_entity.dart';
import 'package:cars_appwrite/features/load_files/domain/use_case/load_use_case.dart';
import 'package:cars_appwrite/server/catch_exceptions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'load_data_state.dart';
part 'load_data_cubit.freezed.dart';

class LoadDataCubit extends Cubit<LoadDataState> {
  LoadDataCubit({required this.useCase})
      : super(const LoadDataState.initial()) {
    loadData();
  }
  final LoadUseCase useCase;
  loadData() async {
    try {
      emit(const LoadDataState.loading());
      emit(LoadDataState.success(await useCase.loadData()));
    } catch (error) {
      emit(LoadDataState.error(CatchException.convertException(error)));
    }
  }

  deleteData(String id) async {
    try {
      emit(const LoadDataState.loading());
      emit(LoadDataState.success(await useCase.deleteData(id)));
    } catch (error) {
      emit(LoadDataState.error(CatchException.convertException(error)));
    }
  }
}
