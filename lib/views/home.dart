import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player_2_flutter/controllers/permission_controller.dart';
import 'package:music_player_2_flutter/controllers/player_controller.dart';
import 'package:music_player_2_flutter/core/constants/palette.dart';
import 'package:music_player_2_flutter/core/constants/text_style.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  //final OnAudioQuery _audioQuery = OnAudioQuery();
  final permissionController = Get.find<PermissionController>();
  final playerController =
      Get.find<PlayerController>(); // Access the controller

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
      body: Obx(
        () => Center(
          child: !permissionController.isLoading.value // true
              ? Container()
              : !permissionController.hasPermission.value
                  ? noAccessToLibraryWidget()
                  : FutureBuilder<List<SongModel>>(
                      future: playerController.audioQuery.querySongs(
                        ignoreCase: true,
                        orderType: OrderType.ASC_OR_SMALLER,
                        sortType: null,
                        uriType: UriType.EXTERNAL,
                      ),
                      builder: (BuildContext context, snapshot) {
                        if (snapshot.hasData) {
                          final songs = snapshot.data!;
                          return ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: songs.length,
                            itemBuilder: (context, index) {
                              final song = songs[index];
                              return Container(
                                margin: const EdgeInsets.only(bottom: 4.0),
                                child: ListTile(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  tileColor: Palette.bgColor,
                                  title: Text(
                                    song.displayNameWOExt,
                                    style: ourTextStyle(
                                      family: bold,
                                      size: 15,
                                    ),
                                  ),
                                  subtitle: Text(
                                    song.artist!,
                                    style: ourTextStyle(
                                      family: regular,
                                      size: 12,
                                    ),
                                  ),
                                  leading: QueryArtworkWidget(
                                    id: song.id,
                                    type: ArtworkType.AUDIO,
                                    nullArtworkWidget: const Icon(
                                      Icons.music_note,
                                      color: Palette.whiteColor,
                                      size: 32.0,
                                    ),
                                  ),
                                  trailing:
                                      playerController.playIndex.value == index
                                          ? const Icon(Icons.play_arrow,
                                              color: Palette.whiteColor,
                                              size: 26.0)
                                          : null,
                                  onTap: () {
                                    playerController.playSong(song.uri);
                                  },
                                ),
                              );
                            },
                          );
                        } else if (snapshot.hasError) {
                          return Text(
                              'Error fetching songs: ${snapshot.error}');
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      }),
        ),
      ),
    );
  }

  Widget noAccessToLibraryWidget() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.yellowAccent.withOpacity(0.5),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Application doesn't have access to the library"),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => permissionController.checkPermission(),
            child: const Text("Allow"),
          ),
        ],
      ),
    );
  }
}
