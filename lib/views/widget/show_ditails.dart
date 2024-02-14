import 'package:flutter/material.dart';

class ShowCountryDitails extends StatelessWidget {
  String? countryName;
  String? flagImage;
  String? officialName;
  String? nativeName;
  bool isLoding = false;

  ShowCountryDitails(
      {this.countryName, this.flagImage, this.officialName, this.nativeName});

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
            SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Ditails:',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  infoText("OfficialName: ${officialName ?? ""}"),
                  SizedBox(height: 10),
                  infoText("NativeName: ${nativeName ?? ""}")
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
      style: TextStyle(fontSize: 18),
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
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
