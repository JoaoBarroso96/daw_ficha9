import 'media.dart';

class Article {
  final String publishedDate;
  final String title;
  final String url;
  final String abs;
  final List<Media> media;

  Article({
    required this.publishedDate,
    required this.title,
    required this.url,
    required this.abs,
    required this.media,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    List<Media> tempMedia = json['media']
        .map<Media>((jsonItem) => Media.fromJson(jsonItem))
        .toList();

    return Article(
      publishedDate: json['published_date'],
      title: json['title'],
      url: json['url'],
      abs: json['abstract'],
      media: tempMedia,
    );
  }
}
