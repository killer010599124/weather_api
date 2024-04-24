import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherData {
  final String dateTime;
  final double temperature;
  final double humidity;
  final double precipitation;
  final double feelsLikeTemperature;
  final double dewPoint;
  final double windGust;
  final double windSpeed;
  final double windDirection;
  final double pressure;
  final double cloudCover;
  final double visibility;
  final double solarRadiation;
  final double solarEnergy;
  final double uvIndex;
  final double severeRisk;
  final String conditions;
  final String icon;
  // final List<String> stations;

  WeatherData({
    required this.dateTime,
    required this.temperature,
    required this.humidity,
    required this.precipitation,
    required this.feelsLikeTemperature,
    required this.dewPoint,
    required this.windGust,
    required this.windSpeed,
    required this.windDirection,
    required this.pressure,
    required this.cloudCover,
    required this.visibility,
    required this.solarRadiation,
    required this.solarEnergy,
    required this.uvIndex,
    required this.severeRisk,
    required this.conditions,
    required this.icon,
    // required this.stations,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      dateTime: json['datetime'],
      temperature: json['temp'].toDouble(),
      humidity: json['humidity'].toDouble(),
      precipitation: json['precip'].toDouble(),
      feelsLikeTemperature: json['feelslike'].toDouble(),
      dewPoint: json['dew'].toDouble(),
      windGust: json['windgust'].toDouble(),
      windSpeed: json['windspeed'].toDouble(),
      windDirection: json['winddir'].toDouble(),
      pressure: json['pressure'].toDouble(),
      cloudCover: json['cloudcover'].toDouble(),
      visibility: json['visibility'].toDouble(),
      solarRadiation: json['solarradiation'].toDouble(),
      solarEnergy: json['solarenergy'].toDouble(),
      uvIndex: json['uvindex'].toDouble(),
      severeRisk: json['severerisk'].toDouble(),
      conditions: json['conditions'],
      icon: json['icon'],
      // stations: List<String>.from(json['stations']),
    );
  }
}

class WeatherDisplay extends StatefulWidget {
  final String data;

  const WeatherDisplay({Key? key, required this.data});
  @override
  _WeatherDisplayState createState() => _WeatherDisplayState();
}

class _WeatherDisplayState extends State<WeatherDisplay> {
  List<WeatherData> weatherDataList = [];
  String location = '';

  Future<void> fetchWeatherData(data) async {
    final jsonList = jsonDecode(data)['days'] as List<dynamic>;
    print(jsonList.length);
    final List<WeatherData> dataList =
        jsonList.map((jsonData) => WeatherData.fromJson(jsonData)).toList();
    setState(() {
      weatherDataList = dataList;
      location = jsonDecode(data)['address'];
      print(dataList);
    });
  }

  @override
  void initState() {
    super.initState();

    fetchWeatherData(widget.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Weather Data'),
        ),
        body: Column(
          children: [
            Text('Address: ${location}'),
            Expanded(
              child: ListView.builder(
                itemCount: weatherDataList.length,
                itemBuilder: (context, index) {
                  final weatherData = weatherDataList[index];
                  // final formattedDate = DateFormat.yMMMd().format(weatherData.dateTime);
                  return ListTile(
                    title: Text(weatherData.dateTime as String),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Temperature: ${weatherData.temperature}°C'),
                        Text(
                            'Feels Like: ${weatherData.feelsLikeTemperature}°C'),
                        Text('Humidity: ${weatherData.humidity}%'),
                        Text('Precipitation: ${weatherData.precipitation}'),
                        Text('Dew Point: ${weatherData.dewPoint}'),
                        Text('Wind Gust: ${weatherData.windGust}'),
                        Text('Wind Speed: ${weatherData.windSpeed}'),
                        Text('Wind Direction: ${weatherData.windDirection}'),
                        Text('Pressure: ${weatherData.pressure}'),
                        Text('Cloud Cover: ${weatherData.cloudCover}'),
                        Text('Visibility: ${weatherData.visibility}'),
                        Text('Solar Radiation: ${weatherData.solarRadiation}'),
                        Text('Solar Energy: ${weatherData.solarEnergy}'),
                        Text('UV Index: ${weatherData.uvIndex}'),
                        Text('Severe Risk: ${weatherData.severeRisk}'),
                        Text('Conditions: ${weatherData.conditions}'),
                        Text('Icon: ${weatherData.icon}'),
                        // Text('Stations: ${weatherData.stations.join(", ")}'),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ));
  }
}
