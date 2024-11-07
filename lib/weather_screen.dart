import "dart:ui";

import "package:flutter/material.dart";
import "package:weather_app/addtional_info_item.dart";
import "package:weather_app/hourly_forecast_item.dart";
import 'package:http/http.dart' as http;
import "package:weather_app/secrets.dart";

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentWeather();
  }
  

  Future getCurrentWeather() async {
    String cityName = 'London';
    final res = await http.get(
      Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$cityName,uk&APPIK=$openWeatherAPIKey'),
    );
    print(res.body);
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather app",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.refresh))],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Column(
                        children: [
                          Text(
                            "300 F",
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Icon(
                            Icons.cloud,
                            size: 64,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            "Rain",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Weather Forecast",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HourlyForecastItem(
                    icon: Icons.cloud,
                    time: "3h23",
                    value: "34",
                  ),
                  HourlyForecastItem(
                    icon: Icons.cloud,
                    time: "3h23",
                    value: "34",
                  ),
                  HourlyForecastItem(
                    icon: Icons.cloud,
                    time: "3h23",
                    value: "34",
                  ),
                  HourlyForecastItem(
                    icon: Icons.cloud,
                    time: "3h23",
                    value: "34",
                  ),
                  HourlyForecastItem(
                    icon: Icons.cloud,
                    time: "3h23",
                    value: "34",
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Additional information",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AddtionalInfoItem(
                  icon: Icons.water_drop,
                  label: "Humidity",
                  value: "91",
                ),
                AddtionalInfoItem(
                  icon: Icons.water_drop,
                  label: "Wind Speed",
                  value: "401",
                ),
                AddtionalInfoItem(
                  icon: Icons.water_drop,
                  label: "Pressure",
                  value: "51",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
