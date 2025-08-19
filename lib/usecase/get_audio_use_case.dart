import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../data/audio_list_data.dart';
import '../enum/language.dart';
import '../repository/get_audio.dart';

class GetAudioUseCase {
  Future<AudioListData?> execute(Language lang, int page) async {
    try {
      var audioListData = await Get.put(GetAudio()).getAudioList(lang, page);

      if (audioListData == null) {
        print('audioListData is null');
      }
      return audioListData;
    } catch (e) {
      print('audioListData is catch $e');
      return null;
    }
  }
}
