
import 'package:flutter/material.dart';
import 'package:music_player_2_flutter/core/constants/palette.dart';

const bold = "bold";
const regular = "regular";

ourTextStyle({family = regular, double? size = 14.0, color= Palette.whiteColor}) {
  return TextStyle(
    fontSize: size,
    color: color,
    fontFamily: family,
  );
}