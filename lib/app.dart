import 'package:all_country_list_apps/views/screen/home_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: ThemeData(appBarTheme: const AppBarTheme(backgroundColor: Colors.yellow)),
      home: const HomeScreen(),
    );
  }
}
