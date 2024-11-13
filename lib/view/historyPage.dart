import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/component/histroyPage/dashboard.dart';
import 'package:weather_app/component/histroyPage/src/TommorowWeatherCompoent.dart';
import 'package:weather_app/view/homepage.dart';

class Historypage extends StatefulWidget {
  const Historypage({super.key});

  @override
  State<Historypage> createState() => _HistorypageState();
}

class _HistorypageState extends State<Historypage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const MyHomepage())),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 25, 25, 25),
        title: Text(
          "7 Days",
          style: GoogleFonts.ubuntu(
              textStyle: const TextStyle(color: Colors.white, fontSize: 20)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              onTap: () {},
              child: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
          )
        ],
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 25, 25, 25),
      body: const Dashboard2(),
    );
  }
}
