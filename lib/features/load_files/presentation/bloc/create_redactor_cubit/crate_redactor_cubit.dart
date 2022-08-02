import 'package:cars_appwrite/features/load_files/domain/cars_entity/cars_entity.dart';
import 'package:cars_appwrite/features/load_files/domain/use_case/create_data_use_case.dart';
import 'package:cars_appwrite/server/catch_exceptions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'crate_redactor_state.dart';
part 'crate_redactor_cubit.freezed.dart';

class CrateRedactorCubit extends Cubit<CrateRedactorState> {
  CrateRedactorCubit({required this.usecase})
      : super(const CrateRedactorState.initial());
  final CreateDataUseCase usecase;
  createData(CarsEntity model) async {
    try {
      emit(const CrateRedactorState.loading());
      await usecase.createData(model);
      emit(const CrateRedactorState.success());
    } catch (error) {
      emit(CrateRedactorState.error(CatchException.convertException(error)));
    }
  }

  redactorData(CarsEntity model) async {
    try {
      emit(const CrateRedactorState.loading());
      await usecase.updateData(model);
      emit(const CrateRedactorState.success());
    } catch (error) {
      emit(CrateRedactorState.error(CatchException.convertException(error)));
    }
  }
}

extension IsLoading on CrateRedactorState {
  bool get isLoading => maybeWhen(
        orElse: () => false,
        loading: () => true,
      );
}
