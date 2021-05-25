import 'package:equatable/equatable.dart';

class WeatherCityDataResponse extends Equatable {
  late final int timestamp;
  late final String date;
  late final double airTemperature;
  late final double cape;
  late final double dewPointTemperature;
  late final double gust;
  late final double highCloudCover;
  late final double horizontalVisibility;
  late final double lowCloudCover;
  late final double mediumCloudCover;
  late final double relativeHumidity;
  late final double snowDepth;
  late final double soilMoistureSurface;
  late final double surfacePressure;
  late final double totalCloudCover;
  late final double totalPrecipitationRate;
  late final double windDirection;
  late final double windSpeed;

  WeatherCityDataResponse(
      {required this.timestamp,
      required this.date,
      required this.airTemperature,
      required this.cape,
      required this.dewPointTemperature,
      required this.gust,
      required this.highCloudCover,
      required this.horizontalVisibility,
      required this.lowCloudCover,
      required this.mediumCloudCover,
      required this.relativeHumidity,
      required this.snowDepth,
      required this.soilMoistureSurface,
      required this.surfacePressure,
      required this.totalCloudCover,
      required this.totalPrecipitationRate,
      required this.windDirection,
      required this.windSpeed});

  @override
  List<Object> get props => [
        timestamp,
        date,
        airTemperature,
        cape,
        dewPointTemperature,
        gust,
        highCloudCover,
        horizontalVisibility,
        lowCloudCover,
        mediumCloudCover,
        relativeHumidity,
        snowDepth,
        soilMoistureSurface,
        surfacePressure,
        totalCloudCover,
        totalPrecipitationRate,
        windDirection,
        windSpeed
      ];

  factory WeatherCityDataResponse.fromJson(Map<String, dynamic> json) =>
      WeatherCityDataResponse(
          timestamp: json['timestamp'],
          date: json['date'],
          airTemperature: json['airTemperature'],
          cape: json['cape'],
          dewPointTemperature: json['dewPointTemperature'],
          gust: json['gust'],
          highCloudCover: json['highCloudCover'],
          horizontalVisibility: json['horizontalVisibility'],
          lowCloudCover: json['lowCloudCover'],
          mediumCloudCover: json['mediumCloudCover'],
          relativeHumidity: json['relativeHumidity'],
          snowDepth: json['snowDepth'],
          soilMoistureSurface: json['soilMoistureSurface'],
          surfacePressure: json['surfacePressure'],
          totalCloudCover: json['totalCloudCover'],
          totalPrecipitationRate: json['totalPrecipitationRate'],
          windDirection: json['windDirection'],
          windSpeed: json['windSpeed']);
}
