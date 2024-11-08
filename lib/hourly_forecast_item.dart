import "package:flutter/material.dart";

class HourlyForecastItem extends StatelessWidget {

    final IconData icon;
  final String time;
  final String value;

  const HourlyForecastItem({super.key , required this.time , required this.icon , required this.value });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        width: 100,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(18)),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              time,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            Icon(
              icon,
              size: 32,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(value)
          ],
        ),
      ),
    );
  }
}
