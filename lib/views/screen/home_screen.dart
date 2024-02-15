import 'dart:convert';

import 'package:all_country_list_apps/model/data.dart';
import 'package:all_country_list_apps/views/widget/show_ditails.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<Country> countryList = [];

class _HomeScreenState extends State<HomeScreen> {
  bool isLodingScreen = false;

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Country List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Visibility(
          visible: isLodingScreen == false,
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
          child: GridView.builder(
            itemCount: countryList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 3,
              crossAxisSpacing: 3,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShowCountryDitails(
                        flagImage: countryList[index].flagImage,
                        countryName: countryList[index].countryName,
                        officialName: countryList[index].officialName,
                        population: countryList[index].population.toString(),
                        startOfWeek: countryList[index].startOfWeek,
                        region: countryList[index].region,
                        subregion: countryList[index].subregion,

                      ),
                    ),
                  );
                },
                child: Card(
                  child: Column(
                    children: [
                      Expanded(
                        child: Image(
                          image:
                              NetworkImage(countryList[index].flagImage ?? ""),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          countryList[index].countryName ?? "",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void getData() async {
    isLodingScreen = true;
    setState(() {});
    Uri url = Uri.parse('https://restcountries.com/v3.1/all#');
    Response response = await get(url);
    if (response.statusCode == 200) {
      var responsBody = jsonDecode(response.body);
      var list = responsBody;
      for (var item in list) {
        Country country = Country.formJson(item);
        print('Fokrul debug');
        countryList.add(country);
      }
      setState(() {});
    }
    isLodingScreen = false;
    setState(() {});

    print(response.statusCode);
    print(response.body);
  }
}
