import 'audio_data.dart';

class AudioListData {
  final int total;
  final List<AudioData> data;

  AudioListData({required this.total, required this.data});

  factory AudioListData.fromJson(Map<String, dynamic> json) => AudioListData(
    total: json["total"],
    data: List<AudioData>.from(json["data"].map((x) => AudioData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}
