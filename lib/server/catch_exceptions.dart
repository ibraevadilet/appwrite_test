class CatchException {
  CatchException({required this.message});
  final String message;

  static CatchException convertException(dynamic error) {
    return CatchException(message: error.message ?? 'Неизвестная ошибка');
  }
}
