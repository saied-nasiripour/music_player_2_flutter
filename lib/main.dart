import 'package:flutter/material.dart';
import 'package:music_player_2_flutter/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'music_player_2_flutter',
      theme: ThemeData(
        fontFamily: "regular",
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent, elevation: 0),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
