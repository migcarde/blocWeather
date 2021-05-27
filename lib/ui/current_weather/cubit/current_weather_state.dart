part of 'current_weather_cubit.dart';

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
