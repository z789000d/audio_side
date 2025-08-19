class AudioData {
  final int id;
  final String title;
  final dynamic summary;
  final String url;
  final dynamic fileExt;
  final DateTime modified;
  bool? fileIsExist;

  AudioData({
    required this.id,
    required this.title,
    this.summary,
    required this.url,
    this.fileExt,
    required this.modified,
    this.fileIsExist,
  });

  factory AudioData.fromJson(Map<String, dynamic> json) => AudioData(
    id: json["id"],
    title: json["title"],
    summary: json["summary"],
    url: json["url"],
    fileExt: json["file_ext"],
    modified: DateTime.parse(json["modified"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "summary": summary,
    "url": url,
    "file_ext": fileExt,
    "modified": modified.toIso8601String(),
  };
}
