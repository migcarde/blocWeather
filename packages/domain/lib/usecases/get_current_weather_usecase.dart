import 'package:dartz/dartz.dart';
import 'package:domain/base/base_usecase.dart';
import 'package:domain/business/current_weather_business.dart';
import 'package:domain/errors/current_weather_error.dart';
import 'package:domain/repository/current_weather_repository_contract.dart';

class GetCurrentWeatherUseCase
    extends BaseUseCase<CurrentWeatherFailure, CurrentWeatherBusiness, String> {
  late final CurrentWeatherRepositoryContract repository;

  GetCurrentWeatherUseCase({required this.repository});

  @override
  Future<Either<CurrentWeatherFailure, CurrentWeatherBusiness>> call(
          String city) =>
      repository.getWeather(city);
}
