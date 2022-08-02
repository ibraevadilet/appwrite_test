import 'package:cars_appwrite/features/auth/domain/use_case/sign_in_use_case.dart';
import 'package:cars_appwrite/server/catch_exceptions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_state.dart';
part 'sign_in_cubit.freezed.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({required this.usecase}) : super(const SignInState.initial());
  final SignInUseCase usecase;
  void signIn(
      {required String name,
      required String email,
      required String password}) async {
    try {
      emit(const SignInState.loading());
      await usecase.signIn(name: name, email: email, password: password);
      emit(const SignInState.success());
    } catch (e) {
      emit(SignInState.error(CatchException.convertException(e)));
    }
  }
}

extension IsLoading on SignInState {
  bool get isLoading => maybeWhen(
        orElse: () => false,
        loading: () => true,
      );
}
