import 'package:dartz/dartz.dart';
import 'package:domain/business/current_weather_business.dart';
import 'package:domain/errors/current_weather_error.dart';

abstract class CurrentWeatherRepositoryContract {
  Future<Either<CurrentWeatherFailure, CurrentWeatherBusiness>> getWeather(
      String city);
}
