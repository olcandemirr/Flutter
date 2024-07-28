import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Hava Durumu'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                labelText: 'Şehir İsmi',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    if (_cityController.text.isNotEmpty) {
                      weatherProvider.fetchWeather(_cityController.text);
                    }
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            if (weatherProvider.isLoading)
              CircularProgressIndicator()
            else if (weatherProvider.weather != null)
              Column(
                children: [
                  Text(
                    weatherProvider.weather!.cityName,
                    style: TextStyle(fontSize: 32),
                  ),
                  Text(
                    '${weatherProvider.weather!.temperature}°C',
                    style: TextStyle(fontSize: 32),
                  ),
                  Text(weatherProvider.weather!.description),
                  Image.network('http://openweathermap.org/img/w/${weatherProvider.weather!.icon}.png'),
                ],
              )
          ],
        ),
      ),
    );
  }
}
