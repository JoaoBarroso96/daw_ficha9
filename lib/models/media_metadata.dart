class MediaMetaData {
  final String url;

  MediaMetaData({
    required this.url,
  });

  factory MediaMetaData.fromJson(Map<String, dynamic> json) {
    return MediaMetaData(
      url: json['url'],
    );
  }
}
