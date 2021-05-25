import 'package:data/datasource/current_weather_remote_data_source.dart';
import 'package:data/responses/current_weather_response.dart';

class CurrentWeatherRepository extends CurrentWeatherRemoteDataSourceContract {
  @override
  Future<CurrentWeatherResponse> getCurrentWeather(String city) {
    // TODO: implement getCurrentWeather
    throw UnimplementedError();
  }
}
