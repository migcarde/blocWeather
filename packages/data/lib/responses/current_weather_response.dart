import 'package:data/responses/weather_city_data_response.dart';
import 'package:data/responses/weather_meta_response.dart';
import 'package:domain/business/current_weather_business.dart';
import 'package:equatable/equatable.dart';

class CurrentWeatherResponse extends Equatable {
  late final WeatherMetaResponse meta;
  late final WeatherCityDataResponse data;

  CurrentWeatherResponse({required this.meta, required this.data});

  @override
  List<Object> get props => [meta, data];

  factory CurrentWeatherResponse.fromJson(Map<String, dynamic> json) =>
      CurrentWeatherResponse(
          meta: WeatherMetaResponse.fromJson(json['meta']),
          data: WeatherCityDataResponse.fromJson(json['data']));

  toDomain() =>
      CurrentWeatherBusiness(meta: meta.toDomain(), data: data.toDomain());
}
