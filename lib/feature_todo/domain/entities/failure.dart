class Failure {}

class ServerFailure extends Failure {
  final String message;

  ServerFailure(this.message);
}

class CacheFailure extends Failure {
  final String message;

  CacheFailure(this.message);
}

class NetworkFailure extends Failure {
  final String message;

  NetworkFailure(this.message);
}

class FormatFailure extends Failure {}
