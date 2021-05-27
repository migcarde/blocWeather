import 'package:domain/usecases/get_current_weather_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/injection_container.dart';
import 'package:weather/ui/current_weather/cubit/current_weather_cubit.dart';

class CurrentWeather extends StatelessWidget {
  const CurrentWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<CurrentWeatherCubit>().init();

    return Scaffold(
      body: Container(
        child: BlocBuilder<CurrentWeatherCubit, CurrentWeatherState>(
          builder: (context, state) {
            if (state is Result) {
              return _renderData(state);
            } else if (state is Error) {
              return Center(child: Text(state.message));
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  _renderData(Result state) {
    return Center(
      child: Text(state.weather.city),
    );
  }
}
