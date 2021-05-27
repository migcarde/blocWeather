import 'package:bloc/bloc.dart';
import 'package:data/repository_failure.dart';
import 'package:domain/business/current_weather_business.dart';
import 'package:domain/errors/current_weather_error.dart';
import 'package:domain/usecases/get_current_weather_usecase.dart';
import 'package:weather/ui/current_weather/current_weather_view_entity.dart';

part 'current_weather_state.dart';

class CurrentWeatherCubit extends Cubit<CurrentWeatherState> {
  final GetCurrentWeatherUseCase getCurrentWeatherUseCase;

  CurrentWeatherCubit({required this.getCurrentWeatherUseCase})
      : super(Loading());

  Future<void> init() async {
    final currentWeather = await getCurrentWeatherUseCase.call('london');

    currentWeather.fold(
        (l) => _handleWeatherError(l), (r) => _handleSuccess(r));
  }

  void _handleWeatherError(CurrentWeatherFailure failure) {
    if (failure is CurrentWeatherRepositoryFailure) {
      return emit(_handleRepositoryFailure(failure));
    } else {
      return emit(Error(
          message: 'Ha ocurrido un error, por favor, inténtelo más tarde'));
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

    return emit(Result(weather: weather));
  }
}
