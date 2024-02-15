import 'package:flutter/material.dart';

class ShowCountryDitails extends StatelessWidget {
  final String? countryName;
  final String? flagImage;
  final String? officialName;
  final String? population;
  final bool isLoding = false;
  final String? startOfWeek;
  final String? region;
  final String? subregion;

  ShowCountryDitails({
    super.key,
    this.countryName,
    this.flagImage,
    this.officialName,
    this.population,
    this.startOfWeek,
    this.region,
    this.subregion,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(countryName ?? ""),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            image(),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'About:',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  infoText("Official Name: ${officialName ?? ""}"),
                  const SizedBox(height: 10),
                  infoText("Population: ${population ?? "".toString()}"),
                  const SizedBox(height: 10),
                  infoText("Start Of Week: ${startOfWeek ?? "".toString()}"),
                  const SizedBox(height: 10),
                  infoText("Region: ${region ?? "".toString()}"),
                  const SizedBox(height: 10),
                  infoText("SubRegion: ${subregion ?? "".toString()}"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget infoText(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget image() {
    return Expanded(
      flex: 2,
      child: Card(
        elevation: 5,
        child: Image(
          image: NetworkImage(flagImage ?? ""),
          width: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
