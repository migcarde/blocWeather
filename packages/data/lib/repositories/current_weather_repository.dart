import 'package:dartz/dartz.dart';
import 'package:data/datasource/current_weather_remote_data_source_contract.dart';
import 'package:data/network_manager.dart';
import 'package:data/repository_failure.dart';
import 'package:domain/errors/current_weather_error.dart';
import 'package:domain/business/current_weather_business.dart';
import 'package:domain/repository/current_weather_repository_contract.dart';

class CurrentWeatherRepository extends CurrentWeatherRepositoryContract {
  late final CurrentWeatherRemoteDataSourceContract remoteDataSource;
  late final NetworkManager networkManager;

  CurrentWeatherRepository(
      {required this.remoteDataSource, required this.networkManager});

  @override
  Future<Either<CurrentWeatherFailure, CurrentWeatherBusiness>> getWeather(
      String city) async {
    try {
      if (await networkManager.hasInternetConnection) {
        final weather = await remoteDataSource.getCurrentWeather(city);

        final result = weather.toDomain();

        return Right(result);
      }

      throw NoInternet();
    } on RepositoryFailure catch (failure) {
      return Left(CurrentWeatherRepositoryFailure(failure: failure));
    } on CurrentWeatherServiceFailure {
      return Left(CurrentWeatherServiceFailure());
    }
  }
}
