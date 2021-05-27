import 'package:domain/business/current_weather_business.dart';
import 'package:equatable/equatable.dart';

class CurrentWeatherViewEntity extends Equatable {
  late final String city;
  late final int timestamp;
  late final double airTemperature;

  CurrentWeatherViewEntity(
      {required this.city,
      required this.timestamp,
      required this.airTemperature});

  @override
  List<Object?> get props => [city, timestamp, airTemperature];
}

extension CurrentWeatherBusinessExtensions on CurrentWeatherBusiness {
  CurrentWeatherViewEntity toDomain() => CurrentWeatherViewEntity(
      city: this.meta.city,
      timestamp: this.data.timestamp,
      airTemperature: this.data.airTemperature);
}
