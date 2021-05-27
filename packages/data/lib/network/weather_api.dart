abstract class WeatherApiContract {
  late final String baseUrl;
  late final String apiKey;
}

class WeatherApi implements WeatherApiContract {
  @override
  String baseUrl = 'api.therainery.com';
  // TODO: Remove it
  @override
  String apiKey = '83E5YGBFCYa2YzyLqvPKV6Pqxo3JGjOjdwDjhnJf';
}
