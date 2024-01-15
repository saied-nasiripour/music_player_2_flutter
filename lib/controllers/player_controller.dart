import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:just_audio/just_audio.dart';

class PlayerController extends GetxController {
  final OnAudioQuery audioQuery = OnAudioQuery();
  final AudioPlayer audioPlayer = AudioPlayer();
  RxInt playIndex = 0.obs;
  RxBool isPlaying = false.obs;

  playSong(String? uri, index) {
    playIndex.value = index;
    try {
      audioPlayer.setAudioSource(
        AudioSource.uri(Uri.parse(uri!)),
      );
      audioPlayer.play();
      isPlaying.value = true;
    } on Exception catch (e){
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
