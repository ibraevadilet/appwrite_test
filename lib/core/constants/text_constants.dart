class AppTextConstants {
  static const String projectId = '62e1309a26827db3b845';
  static const String endpoint = 'http://192.168.43.27:4003/v1';
  static const String collectionID = '62e27ff5b67b596f94be';
  static const String bucketID = '62e759fc8616a9cb8cb1';
  static const String databaseID = 'idcars00';
  static const String enterEmail = 'Введите email';
  static const String enterPassword = 'Введите пароль';
  static const String enterName = 'Введите имя';
  static const String email = 'email';
  static const String password = 'password';
  static const String name = 'name';

  static const String login = 'Log In';
  static const String signin = 'Sign In';

  static const String createStream =
      'databases.$databaseID.collections.$collectionID.documents.*.create';
  static const String deleteStream =
      'databases.$databaseID.collections.$collectionID.documents.*.delete';
  static const String updateStream =
      'databases.$databaseID.collections.$collectionID.documents.*.update';
}

class SharedKeys {
  static const String email = 'email';
}
