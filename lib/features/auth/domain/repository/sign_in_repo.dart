abstract class SignInRepo {
  signIn(
      {required String userId,
      required String name,
      required String email,
      required String password});
  saveEmail({required String email});
}
