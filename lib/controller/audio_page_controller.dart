import 'package:audio_test/data/audio_data.dart';
import 'package:audio_test/usecase/download_audio_use_case.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../data/audio_list_data.dart';
import '../usecase/check_audio_exist_use_case.dart';
import '../usecase/get_audio_use_case.dart';
import 'package:audio_test/enum/language.dart';

import '../usecase/play_audio_use_case.dart';

class AudioPageController extends GetxController {
  var audioData =
      AudioData(id: 0, title: '', url: '', modified: DateTime.timestamp()).obs;
  AudioPlayer audioPlayer = AudioPlayer();
  var playAudioUseCase = PlayAudioUseCase();

  var playerState = PlayerState.stopped.obs;
  var duration = Duration.zero.obs;
  var position = Duration.zero.obs;

  void onInit() {
    super.onInit();
    var arguments = Get.arguments as AudioData;
    audioData.value = arguments;
    print('audioData: ${audioData.value}');
    _listenToPlayerStreams();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void _listenToPlayerStreams() {
    audioPlayer.onDurationChanged.listen((d) {
      duration.value = d;
    });

    audioPlayer.onPlayerStateChanged.listen((s) async {
      playerState.value = s;
    });
  }

  void playAudio() async {
    if (playerState.value == PlayerState.stopped ||
        playerState.value == PlayerState.paused) {
      if (playerState.value == PlayerState.stopped) {
        Future.delayed(Duration(milliseconds: 3000), () {
          audioPlayer.onPositionChanged.listen((p) {
            position.value = p;
          });
          //測試 第一次一秒後再掛上監聽 消除延遲
        });
      }
      await playAudioUseCase.execute(
        audioPlayer,
        audioData.value.id.toString(),
      );
    }
  }

  void pauseAudio() async {
    if (playerState.value == PlayerState.playing) {
      await audioPlayer.pause();
    }
  }

  void seek(Duration d) async {
    await audioPlayer.seek(d);
  }

  String formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(d.inMinutes.remainder(60));
    final seconds = twoDigits(d.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  void onClose() {
    audioPlayer.dispose();
    super.onClose();
  }
}
