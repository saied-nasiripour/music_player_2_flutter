
import 'dart:ui';
import 'package:music_player_2_flutter/core/constants/palette.dart';

const bold = "bold";
const regular = "regular";

ourStyle({family = regular, double? size = 14, color= Palette.whiteColor}) {
  return TextStyle(
    fontSize: size,
    color: color,
    fontFamily: family,
  );
}