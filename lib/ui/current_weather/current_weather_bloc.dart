import 'package:data/repository_failure.dart';
import 'package:domain/business/current_weather_business.dart';
import 'package:domain/errors/current_weather_error.dart';
import 'package:domain/usecases/get_current_weather_usecase.dart';
import 'package:weather/base/base_bloc.dart';
import 'package:weather/ui/current_weather/current_weather_state.dart';
import 'current_weather_view_entity.dart';

class CurrentWeatherBloc extends BaseBloc<CurrentWeatherState> {
  final GetCurrentWeatherUseCase getCurrentWeatherUseCase;

  CurrentWeatherBloc({required this.getCurrentWeatherUseCase})
      : super([getCurrentWeatherUseCase]);

  Future<void> init() async {
    final currentWeather = await getCurrentWeatherUseCase.call('London');

    currentWeather.fold(
        (l) => _handleWeatherError(l), (r) => _handleSuccess(r));
  }

  _handleWeatherError(CurrentWeatherFailure failure) {
    if (failure is CurrentWeatherRepositoryFailure) {
      return _handleRepositoryFailure(failure);
    } else {
      return Error(
          message: 'Ha ocurrido un error, por favor, inténtelo más tarde');
    }
  }

  Error _handleRepositoryFailure(
      CurrentWeatherRepositoryFailure currentWeatherRepositoryFailure) {
    if (currentWeatherRepositoryFailure is NoInternet) {
      return Error(message: 'No internet');
    } else {
      return Error(
          message: 'Ha ocurrido un error, por favor, inténtelo más tarde');
    }
  }

  void _handleSuccess(CurrentWeatherBusiness business) {
    final weather = business.toDomain();

    changeState(Result(weather: weather));
  }
}
