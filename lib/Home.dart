import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_api/WeatherDisplay.dart';
import 'package:weather_api/customInputText.dart';
import 'textStyle.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _serverTextController;
  String location = '';
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _serverTextController = TextEditingController();
  }

  @override
  void dispose() {
    _serverTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 100),
                  Text(
                    'Weather ',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont(
                      'League Spartan',
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    'This is Demo app to test \n our weather api integration',
                    style: CustomTextStyle.body,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 80),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      'location',
                      style: CustomTextStyle.alertText,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomInputText(
                    textEditingController: _serverTextController,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: isLoading ? null : handleContinuePressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF0058D9),
                      ),
                      child: Text(
                        'Get Weather',
                        style: CustomTextStyle.buttonText,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (isLoading)
              Container(
                color: Colors.black.withOpacity(0.5),
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void handleContinuePressed() async {
    setState(() {
      isLoading = true;
    });

    location = _serverTextController.text;
    await getWeather();

    setState(() {
      isLoading = false;
    });
  }

  Future<void> getWeather() async {
    print(location);
    var url = Uri.parse(
        'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/$location?unitGroup=us&key=3C8TRCWYPKSPU83H6U8CJ5CUR&contentType=json');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = response.body;
      // print(jsonDecode(data)['days'][5]);
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WeatherDisplay(data: data),
        ),
      );
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
