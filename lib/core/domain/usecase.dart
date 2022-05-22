abstract class UseCaseFuture<T, P> {
  Future<T> call(P param);
}

abstract class UseCase<T, P> {
  T call(P param);
}
