import 'package:domain/business/weather_meta_business.dart';
import 'package:equatable/equatable.dart';

class WeatherMetaResponse extends Equatable {
  late final String city;
  late final String country;
  late final String adminCode;
  late final String latitude;
  late final String longitude;
  late final String dailyRequestLimit;
  late final String requestRemaining;

  WeatherMetaResponse(
      {required this.city,
      required this.country,
      required this.adminCode,
      required this.latitude,
      required this.longitude,
      required this.dailyRequestLimit,
      required this.requestRemaining});

  @override
  List<Object> get props => [
        city,
        country,
        adminCode,
        latitude,
        longitude,
        dailyRequestLimit,
        requestRemaining
      ];

  factory WeatherMetaResponse.fromJson(Map<String, dynamic> json) =>
      WeatherMetaResponse(
          city: json['city'],
          country: json['country'],
          adminCode: json['adminCode'],
          latitude: json['latitude'],
          longitude: json['longitude'],
          dailyRequestLimit: json['dailyRequestLimit'],
          requestRemaining: json['requestRemaining']);

  toDomain() => WeatherMetaBusiness(
      city: city,
      country: country,
      adminCode: adminCode,
      latitude: latitude,
      longitude: longitude,
      dailyRequestLimit: dailyRequestLimit,
      requestRemaining: requestRemaining);
}
