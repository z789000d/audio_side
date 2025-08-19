import 'package:audio_test/data/audio_data.dart';
import 'package:audio_test/usecase/download_audio_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../data/audio_list_data.dart';
import '../usecase/check_audio_exist_use_case.dart';
import '../usecase/get_audio_use_case.dart';
import 'package:audio_test/enum/language.dart';

import '../usecase/play_audio_use_case.dart';

class FirstPageController extends GetxController {
  var nowPage = 1;
  var totalPage = -1;
  RxList<AudioData> audioList = <AudioData>[].obs;
  final ScrollController scrollController = ScrollController();
  bool _isEndOfScroll = false;
  var checkAudioExistUseCase = CheckAudioExistUseCase();
  var downloadAudioUseCase = DownloadAudioUseCase();

  @override
  void onReady() {
    super.onReady();
    _addScrollListener();
    _resetValue();
    _getValue();
  }

  void _addScrollListener() {
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent) {
      if (!_isEndOfScroll) {
        if (nowPage < totalPage) {
          _isEndOfScroll = true;
          nowPage++;
          print('nowpage ${nowPage}');
          await _getMore(nowPage);
        } else {
          print('已經到底');
        }
      }
    } else {
      _isEndOfScroll = false;
    }
  }

  void _resetValue() {
    nowPage = 1;
    totalPage = -1;
  }

  void _getValue() async {
    var value = await GetAudioUseCase().execute(Language.zhTw, 1);
    totalPage = ((value?.total ?? 0) / 30).ceil(); //無條件進位拿到總頁數

    final List<AudioData> tempAudioList = [];

    for (var audio in value!.data) {
      var fileExist = await checkAudioExistUseCase.execute(audio.id.toString());
      audio.fileIsExist = fileExist;
      tempAudioList.add(audio);
    }

    audioList.value = tempAudioList;
  }

  Future<void> _getMore(int page) async {
    await EasyLoading.show(status: 'loading...');
    var value = await GetAudioUseCase().execute(Language.zhTw, page);
    totalPage = ((value?.total ?? 0) / 30).ceil(); //無條件進位拿到總頁數
    print('total page $totalPage');

    final List<AudioData> tempAudioList = [];
    for (var audio in value!.data) {
      var fileExist = await checkAudioExistUseCase.execute(audio.id.toString());
      audio.fileIsExist = fileExist;
      tempAudioList.add(audio);
    }

    final updatedSet = {...audioList, ...(tempAudioList)};
    audioList.value = updatedSet.toList();
    EasyLoading.dismiss();
  }

  void downloadAudio(AudioData audioData) async {
    await EasyLoading.show(status: 'downloading...');
    var result = await downloadAudioUseCase.execute(
      audioData.id.toString(),
      audioData.url,
    );

    if (result != null) {
      audioData.fileIsExist = true;
    }

    audioList.refresh();

    EasyLoading.dismiss();
  }
}
