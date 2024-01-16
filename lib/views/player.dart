import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player_2_flutter/controllers/player_controller.dart';
import 'package:music_player_2_flutter/core/constants/palette.dart';
import 'package:music_player_2_flutter/core/constants/text_style.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Player extends StatelessWidget {
  Player({Key? key, required this.songModel}) : super(key: key);
  final List<SongModel> songModel;
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
                height: 250,
                width: 250,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Obx(
                  () => QueryArtworkWidget(
                    id: songModel[playerController.playIndex.value].id,
                    type: ArtworkType.AUDIO,
                    artworkHeight: double.infinity,
                    artworkWidth: double.infinity,
                    nullArtworkWidget: const Icon(Icons.music_note,
                        size: 48, color: Palette.whiteColor),
                  ),
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
                child: Obx(
                  () => Column(
                    children: [
                      // ------------------- Music name and artist and times --------------------------
                      Text(
                        songModel[playerController.playIndex.value]
                            .displayNameWOExt
                            .toString(),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: ourTextStyle(
                            color: Palette.bgDarkColor, family: bold, size: 24),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        songModel[playerController.playIndex.value]
                            .artist!
                            .toString(),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: ourTextStyle(
                            color: Palette.bgDarkColor,
                            family: regular,
                            size: 20),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          // ------------------- Position Time --------------------------
                          Text(playerController.position.value,
                              style: ourTextStyle(color: Palette.bgDarkColor)),
                          // ------------------- Slider for Seek --------------------------
                          Expanded(
                              child: Slider(
                            thumbColor: Palette.sliderColor,
                            activeColor: Palette.sliderColor,
                            inactiveColor: Palette.bgColor,
                            min:
                                const Duration(seconds: 0).inSeconds.toDouble(),
                            max: playerController.max.value,
                            value: playerController.value.value,
                            onChanged: (newValue) {
                              playerController
                                  .changeDurationToSeconds(newValue.toInt());
                              newValue = newValue;
                            },
                          )),
                          // ------------------- Duration Time --------------------------
                          Text(playerController.duration.value,
                              style: ourTextStyle(color: Palette.bgDarkColor)),
                        ],
                      ),
                      const SizedBox(height: 12),
                      // ------------------- Control Buttons --------------------------
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // ------------------- Previous Buttons --------------------------
                          IconButton(
                            onPressed: () {
                              playerController.playSong(
                                  songModel[
                                          playerController.playIndex.value - 1]
                                      .uri,
                                  playerController.playIndex.value - 1);
                            },
                            icon: const Icon(
                              Icons.skip_previous_rounded,
                              size: 40,
                              color: Palette.bgDarkColor,
                            ),
                          ),
                          // ------------------- Play Buttons --------------------------
                          CircleAvatar(
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
                          // ------------------- Next Buttons --------------------------
                          IconButton(
                            onPressed: () {
                              playerController.playSong(
                                  songModel[
                                          playerController.playIndex.value + 1]
                                      .uri,
                                  playerController.playIndex.value + 1);
                            },
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
            ),
          ],
        ),
      ),
    );
  }
}
