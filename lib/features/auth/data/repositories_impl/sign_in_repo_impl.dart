import 'package:appwrite/appwrite.dart';
import 'package:cars_appwrite/core/constants/text_constants.dart';
import 'package:cars_appwrite/features/auth/domain/repository/sign_in_repo.dart';
import 'package:cars_appwrite/server/catch_exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInRepoImpl implements SignInRepo {
  SignInRepoImpl({required this.account, required this.prefs});
  final Account account;
  final SharedPreferences prefs;
  @override
  signIn({
    required String name,
    required String email,
    required String password,
    required String userId,
  }) async {
    try {
      await account.create(
          userId: userId, email: email, password: password, name: name);
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }

  @override
  saveEmail({required String email}) {
    prefs.setString(SharedKeys.email, email);
  }
}
