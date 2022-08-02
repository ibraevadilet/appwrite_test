import 'package:cars_appwrite/features/auth/domain/repository/log_in_repo.dart';

class LogInUseCase {
  LogInUseCase({required this.repo});
  final LogInRepo repo;

  Future<void> login({required String email, required String password}) async {
    try {
      final responce = await repo.logIn(email: email, password: password);
      repo.saveEmail(email: email);
      return responce;
    } catch (e) {
      rethrow;
    }
  }
}
