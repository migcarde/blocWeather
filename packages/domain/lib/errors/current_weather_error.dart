import 'package:data/repository_failure.dart';

abstract class CurrentWeatherFailure {
  CurrentWeatherFailure([List properties = const <dynamic>[]]) : super();
}

class CurrentWeatherRepositoryFailure extends CurrentWeatherFailure {
  late final RepositoryFailure failure;

  CurrentWeatherRepositoryFailure({required this.failure}) : super([failure]);
}

class CurrentWeatherServiceFailure extends CurrentWeatherFailure {}
