class HttpException implements Exception {
  final String messsage;

  HttpException(this.messsage);

  @override
  String toString() {
    return messsage;
  }
}
