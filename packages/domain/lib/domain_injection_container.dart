import 'package:domain/usecases/get_current_weather_usecase.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void init() {
  // Use cases
  getIt.registerFactory(() => GetCurrentWeatherUseCase(repository: getIt()));
}
