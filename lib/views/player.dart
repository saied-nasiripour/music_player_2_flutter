import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player_2_flutter/controllers/player_controller.dart';
import 'package:music_player_2_flutter/core/constants/palette.dart';
import 'package:music_player_2_flutter/core/constants/text_style.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Player extends StatelessWidget {
  Player({Key? key, required this.songModel}) : super(key: key);
  final SongModel songModel;
  final playerController = Get.find<PlayerController>();

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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                height: 300,
                width: 300,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: QueryArtworkWidget(
                  id: songModel.id,
                  type: ArtworkType.AUDIO,
                  artworkHeight: double.infinity,
                  artworkWidth: double.infinity,
                  nullArtworkWidget: const Icon(Icons.music_note,
                      size: 48, color: Palette.whiteColor),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(16.0)),
                  color: Palette.whiteColor,
                ),
                child: Column(
                  children: [
                    Text(
                      songModel.displayNameWOExt,
                      style: ourTextStyle(
                          color: Palette.bgDarkColor, family: bold, size: 24),
                    ),
                    Text(
                      songModel.artist!.toString(),
                      style: ourTextStyle(
                          color: Palette.bgDarkColor,
                          family: regular,
                          size: 20),
                    ),
                    const SizedBox(height: 12),
                    Obx(
                        () => Row(
                        children: [
                          Text(playerController.position.value,
                              style: ourTextStyle(color: Palette.bgDarkColor)),
                          Expanded(
                              child: Slider(
                            thumbColor: Palette.sliderColor,
                            activeColor: Palette.sliderColor,
                            inactiveColor: Palette.bgColor,
                            value: 0.0,
                            onChanged: (newValue) {},
                          )),
                          Text(playerController.duration.value,
                              style: ourTextStyle(color: Palette.bgDarkColor)),
                        ],
                      ),
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
                        Obx(
                          () => CircleAvatar(
                            radius: 40,
                            backgroundColor: Palette.bgDarkColor,
                            child: Transform.scale(
                              scale: 1.5,
                              child: IconButton(
                                onPressed: () {
                                  if (playerController.isPlaying.value) {
                                    playerController.audioPlayer.pause();
                                    playerController.isPlaying(false);
                                  } else {
                                    playerController.audioPlayer.play();
                                    playerController.isPlaying(true);
                                  }
                                },
                                icon: playerController.isPlaying.value
                                ? const Icon(
                                  Icons.pause,
                                  size: 54,
                                  color: Palette.whiteColor,
                                )
                                : const Icon(
                                  Icons.play_arrow_rounded,
                                  size: 54,
                                  color: Palette.whiteColor,
                                ),
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
      ),
    );
  }
}
