import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player_2_flutter/controllers/permission_controller.dart';
import 'package:music_player_2_flutter/controllers/player_controller.dart';
import 'package:music_player_2_flutter/core/constants/palette.dart';
import 'package:music_player_2_flutter/views/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(PermissionController());
  Get.put(PlayerController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SNP_Music_Player_2_flutter',
      theme: ThemeData(
        fontFamily: "regular",
        appBarTheme: const AppBarTheme(
            backgroundColor: Palette.bgDarkColor, elevation: 0),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Home(),
    );
  }
}
