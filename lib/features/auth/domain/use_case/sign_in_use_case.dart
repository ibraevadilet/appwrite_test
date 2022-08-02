import 'dart:math';

import 'package:cars_appwrite/features/auth/domain/repository/sign_in_repo.dart';

class SignInUseCase {
  SignInUseCase({required this.repo});
  final SignInRepo repo;

  Future<void> signIn(
      {required String name,
      required String email,
      required String password}) async {
    int id = Random().nextInt(999999999) + 111111111;
    String userId = 'user_id_$id';
    try {
      final responce = await repo.signIn(
          userId: userId, name: name, email: email, password: password);
      repo.saveEmail(email: email);
      return responce;
    } catch (e) {
      rethrow;
    }
  }
}
