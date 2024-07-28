import 'package:flutter/material.dart';
import '../models/weather.dart';

class WeatherProvider with ChangeNotifier {
  Weather? _weather;
  bool _isLoading = false;

  Weather? get weather => _weather;
  bool get isLoading => _isLoading;

  void fetchWeather(String cityName) {
    _isLoading = true;
    notifyListeners();

    // Statik veri kullanımı
    Future.delayed(Duration(seconds: 2), () {
      _weather = Weather(
        cityName: cityName,
        temperature: 25.0,
        description: 'Güneşli',
        icon: '01d',
      );

      _isLoading = false;
      notifyListeners();
    });
  }
}
