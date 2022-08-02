import 'package:cars_appwrite/features/auth/domain/use_case/log_in_use_case.dart';
import 'package:cars_appwrite/server/catch_exceptions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'log_in_state.dart';
part 'log_in_cubit.freezed.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit({required this.usecase}) : super(const LogInState.initial());
  final LogInUseCase usecase;
  logIn({required String email, required String password}) async {
    try {
      emit(const LogInState.loading());
      await usecase.login(email: email, password: password);
      emit(const LogInState.success());
    } catch (e) {
      emit(LogInState.error(CatchException.convertException(e)));
    }
  }
}

extension IsLoading on LogInState {
  bool get isLoading => maybeWhen(
        orElse: () => false,
        loading: () => true,
      );
}
