class TodoException {
  final String message;

  TodoException(this.message);
}

class ServerException extends TodoException {
  ServerException(super.message);
}

class CacheException extends TodoException {
  CacheException(super.message);
}

class NetworkException extends TodoException {
  NetworkException(super.message);
}
