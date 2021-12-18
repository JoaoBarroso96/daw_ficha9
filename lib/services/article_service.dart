import 'dart:convert';

import 'package:ficha9/models/article.dart';
import 'package:http/http.dart' as http;

class ArticleService {
  Future fetchArticles() async {
    final response = await http.get(Uri.parse(
        'https://api.nytimes.com/svc/mostpopular/v2/viewed/1.json?api-key=B7YosWXqwAtN80EQbxnYdDUQ5AGkNUtv'));

    if (response.statusCode == 200) {
      List<Article> articles = jsonDecode(response.body)['results']
          .map<Article>((jsonItem) => Article.fromJson(jsonItem))
          .toList();

      return articles;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load artible');
    }
  }
}
