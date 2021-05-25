import 'package:data/responses/current_weather_response.dart';

abstract class CurrentWeatherRemoteDataSourceContract {
  Future<CurrentWeatherResponse> getCurrentWeather(String city);
}
