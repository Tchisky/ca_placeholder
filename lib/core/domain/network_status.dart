import 'package:data_connection_checker_tv/data_connection_checker.dart';

abstract class NetworkStatus {
  Future<bool> get connected;
}

class NetworkStatusImpl implements NetworkStatus {
  final DataConnectionChecker connectionChecker;

  NetworkStatusImpl(this.connectionChecker);

  @override
  Future<bool> get connected => connectionChecker.hasConnection;
}
