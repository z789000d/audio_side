import 'package:audio_test/enum/language.dart';
import 'package:get/get_connect/connect.dart';

import '../data/audio_list_data.dart';

class GetAudio extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'https://www.travel.taipei/open-api/';
    httpClient.addRequestModifier<dynamic>((request) {
      request.headers['Accept'] = 'application/json';
      return request;
    });
  }

  Future<AudioListData?> getAudioList(Language lang, int page) async {
    final response = await get('${lang.value}/Media/Audio?page=$page');
    if (response.statusCode == 200) {
      return AudioListData.fromJson(response.body);
    } else {
      return null;
    }
  }
}
