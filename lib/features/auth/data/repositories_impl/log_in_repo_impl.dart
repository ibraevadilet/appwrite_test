import 'package:appwrite/appwrite.dart';
import 'package:cars_appwrite/core/constants/text_constants.dart';
import 'package:cars_appwrite/features/auth/domain/repository/log_in_repo.dart';
import 'package:cars_appwrite/server/catch_exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInRepoImpl implements LogInRepo {
  LogInRepoImpl({required this.account, required this.prefs});
  final Account account;
  final SharedPreferences prefs;

  @override
  logIn({required String email, required String password}) async {
    try {
      await account.createEmailSession(email: email, password: password);
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }

  @override
  saveEmail({required String email}) {
    prefs.setString(SharedKeys.email, email);
  }
}
