import 'package:data/responses/weather_city_data_response.dart';
import 'package:data/responses/weather_meta_response.dart';
import 'package:equatable/equatable.dart';

class CurrentWeatherBusiness extends Equatable {
  late final WeatherMetaResponse meta;
  late final WeatherCityDataResponse data;

  CurrentWeatherBusiness({required this.meta, required this.data});

  @override
  List<Object> get props => [meta, data];

  factory CurrentWeatherBusiness.fromJson(Map<String, dynamic> json) =>
      CurrentWeatherBusiness(
          meta: WeatherMetaResponse.fromJson(json['meta']),
          data: WeatherCityDataResponse.fromJson(json['data']));
}
