import 'package:connectivity/connectivity.dart';
import 'package:data/datasource/current_weather_remote_data_source_contract.dart';
import 'package:data/network/weather_api.dart';
import 'package:data/network_manager.dart';
import 'package:data/remote-data-source/current_weather_remote_data_source.dart';
import 'package:data/repositories/current_weather_repository.dart';
import 'package:domain/repository/current_weather_repository_contract.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void init() {
  // Repository
  getIt.registerLazySingleton<CurrentWeatherRepositoryContract>(() =>
      CurrentWeatherRepository(
          remoteDataSource: getIt(), networkManager: getIt()));

  // Remote data source
  getIt.registerLazySingleton<CurrentWeatherRemoteDataSourceContract>(
      () => CurrentWeatherRemoteDataSource(weatherApi: getIt()));

  // Network
  getIt.registerLazySingleton<WeatherApiContract>(() => WeatherApi());

  // Others
  getIt.registerLazySingleton(() => NetworkManager(connectivity: getIt()));
  getIt.registerLazySingleton(() => Connectivity());
}
