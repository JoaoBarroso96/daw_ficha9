import 'package:ficha9/models/media_metadata.dart';

class Media {
  final String type;
  final String caption;
  final List<MediaMetaData> mediaMetaData;

  Media({
    required this.type,
    required this.caption,
    required this.mediaMetaData,
  });

  factory Media.fromJson(Map<String, dynamic> json) {
    List<MediaMetaData> tempMedia = json['media-metadata']
        .map<MediaMetaData>((jsonItem) => MediaMetaData.fromJson(jsonItem))
        .toList();

    return Media(
      type: json['type'],
      caption: json['caption'],
      mediaMetaData: tempMedia,
    );
  }
}
