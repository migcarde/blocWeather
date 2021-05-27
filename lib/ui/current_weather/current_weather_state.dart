import 'package:weather/ui/current_weather/current_weather_view_entity.dart';

abstract class CurrentWeatherState {
  CurrentWeatherState([List properties = const <dynamic>[]]) : super();
}

class Loading extends CurrentWeatherState {}

class Error extends CurrentWeatherState {
  late final String message;

  Error({required this.message}) : super([message]);
}

class Result extends CurrentWeatherState {
  late final CurrentWeatherViewEntity weather;

  Result({required this.weather}) : super([weather]);
}
