import 'dart:io';

import 'package:data/datasource/current_weather_remote_data_source_contract.dart';
import 'package:data/network/weather_api.dart';
import 'package:data/repository_failure.dart';
import 'package:data/responses/current_weather_response.dart';
import 'package:data/network_request.dart' as httpInterceptor;
import 'package:http/http.dart' as http;
import 'package:data/response_parser.dart';

class CurrentWeatherRemoteDataSource
    extends CurrentWeatherRemoteDataSourceContract {
  late final WeatherApiContract weatherApi;

  CurrentWeatherRemoteDataSource({required this.weatherApi});

  @override
  Future<CurrentWeatherResponse> getCurrentWeather(String city) async {
    final Uri uri =
        Uri.https(weatherApi.baseUrl, '/forecast/weather?city=$city');

    try {
      final apiKey = weatherApi.apiKey;
      final response = await http.get(uri,
          headers: {"x-api-key": "83E5YGBFCYa2YzyLqvPKV6Pqxo3JGjOjdwDjhnJf"});
      final body = parsedResponse(response);

      return CurrentWeatherResponse.fromJson(body);
    } on SocketException {
      throw NoInternet;
    } on HttpException {
      throw RepositoryException;
    } on FormatException {
      throw RepositoryException;
    } catch (e) {
      throw Unknown;
    }
  }
}
