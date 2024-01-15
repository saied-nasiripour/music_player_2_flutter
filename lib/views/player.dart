import 'package:flutter/material.dart';
import 'package:music_player_2_flutter/core/constants/palette.dart';
import 'package:music_player_2_flutter/core/constants/text_style.dart';

class Player extends StatelessWidget {
  const Player({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.bgColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Palette.whiteColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
              alignment: Alignment.center,
              child: const Icon(Icons.music_note),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
                color: Palette.whiteColor,
              ),
              child: Column(
                children: [
                  Text(
                    "Music Name",
                    style: ourTextStyle(
                        color: Palette.bgDarkColor, family: bold, size: 24),
                  ),
                  Text(
                    "Artist Name",
                    style: ourTextStyle(
                        color: Palette.bgDarkColor, family: regular, size: 20),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Text("0:0",
                          style: ourTextStyle(color: Palette.bgDarkColor)),
                      Expanded(
                          child: Slider(
                        thumbColor: Palette.sliderColor,
                        activeColor: Palette.sliderColor,
                        inactiveColor: Palette.bgColor,
                        value: 0.0,
                        onChanged: (newValue) {},
                      )),
                      Text("04:00",
                          style: ourTextStyle(color: Palette.bgDarkColor)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.skip_previous_rounded,
                          size: 40,
                          color: Palette.bgDarkColor,
                        ),
                      ),
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Palette.bgDarkColor,
                        child: Transform.scale(
                          scale: 1.5,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.play_arrow_rounded,
                              size: 54,
                              color: Palette.whiteColor,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.skip_next_rounded,
                          size: 40,
                          color: Palette.bgDarkColor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
