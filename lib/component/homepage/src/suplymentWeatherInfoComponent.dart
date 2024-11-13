import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_icons/weather_icons.dart';

class SupplymentInfoWidet extends StatefulWidget {
  final String windSpeed;
  final String humidity;
  final String rain;
  const SupplymentInfoWidet(
      {super.key,
      required this.windSpeed,
      required this.humidity,
      required this.rain});

  @override
  State<SupplymentInfoWidet> createState() => _SupplymentInfoWidetState();
}

class _SupplymentInfoWidetState extends State<SupplymentInfoWidet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(15),
      width: 100,
      height: 98,
      decoration: BoxDecoration(
          color: const Color.fromARGB(53, 52, 52, 52),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SupplymentInfoWidgetComponents(
              icon: WeatherIcons.windy,
              title: "${widget.windSpeed}",
              subtitle: "Wind"),
          SupplymentInfoWidgetComponents(
              icon: Icons.water_drop,
              title: "${widget.humidity}",
              subtitle: "Humidity"),
          SupplymentInfoWidgetComponents(
              icon: WeatherIcons.rain,
              title: "${widget.rain}",
              subtitle: "Rain")
        ],
      ),
    );
  }
}

class SupplymentInfoWidgetComponents extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const SupplymentInfoWidgetComponents(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 100,
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Column(
        children: [
          Icon(
            icon,
            size: 25,
            color: Colors.white,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(title,
              style: GoogleFonts.ubuntu(
                textStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              )),
          Text(subtitle,
              style: GoogleFonts.ubuntu(
                textStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ))
        ],
      ),
    );
  }
}
