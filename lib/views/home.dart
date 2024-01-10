import 'package:flutter/material.dart';
import 'package:music_player_2_flutter/core/constants/palette.dart';
import 'package:music_player_2_flutter/core/constants/text_style.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.bgDarkColor,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Palette.whiteColor,
              ))
        ],
        leading: const Icon(
          Icons.sort_rounded,
          color: Palette.whiteColor,
        ),
        title: Text(
          "Music Player v2",
          //ourStyle
          style: ourTextStyle(family: bold, size: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 100,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 4.0),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                tileColor: Palette.bgColor,
                title: Text(
                  "Music Name",
                  style: ourTextStyle(
                    family: bold,
                    size: 15,
                  ),
                ),
                subtitle: Text(
                  "Artist Name",
                  style: ourTextStyle(
                    family: regular,
                    size: 12,
                  ),
                ),
                leading: const Icon(
                  Icons.music_note,
                  color: Palette.whiteColor,
                  size: 32.0,
                ),
                trailing: const Icon(
                  Icons.play_arrow,
                  color: Palette.whiteColor,
                  size: 26.0,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
