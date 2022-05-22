import 'package:ca_place_holder/core/domain/network_status.dart';
import 'package:ca_place_holder/feature_todo/injection_container.dart'
    as FeatureTodo;
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:get_it/get_it.dart';

final GetIt injection = GetIt.instance;

void initDependencyTree() {
  // init core
  _initCoreDependencies(injection);

  // init feature_todo
  FeatureTodo.initFeatureTodoDependencies(injection);
}

void _initCoreDependencies(GetIt injection) {
  injection.registerLazySingleton<DataConnectionChecker>(
    () => DataConnectionChecker(),
  );

  injection.registerLazySingleton<NetworkStatus>(
      () => NetworkStatusImpl(injection()));
}
