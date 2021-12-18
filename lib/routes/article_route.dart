import 'package:ficha9/models/article.dart';
import 'package:ficha9/services/article_service.dart';
import 'package:flutter/material.dart';

class ArticleRoute extends StatefulWidget {
  @override
  _ArticleRoute createState() => new _ArticleRoute();
}

class _ArticleRoute extends State<ArticleRoute> {
  var articles = <Article>[];

  @override
  void initState() {
    _getArticles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: List.generate(
      articles.length,
      (index) {
        return ArticleCard(article: articles[index], c: context);
      },
    ));
  }

  Future<void> _getArticles() async {
    ArticleService articleService = new ArticleService();

    var newArticles = await articleService.fetchArticles();
    setState(() {
      articles = newArticles;
    });
  }
}

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    Key? key,
    required this.article,
    required this.c,
  }) : super(key: key);

  final Article article;
  final BuildContext c;

  @override
  Widget build(BuildContext context) {
    String imageUrl;
    if (article.media.isEmpty) {
      imageUrl =
          'https://i0.wp.com/greenvolt.com.br/wp-content/uploads/2018/05/ef3-placeholder-image.jpg';
    } else {
      imageUrl = article.media[0]
          .mediaMetaData[article.media[0].mediaMetaData.length - 1].url;
    }

    var paddingCard = EdgeInsets.fromLTRB(
        MediaQuery.of(context).size.width * 0.02,
        MediaQuery.of(context).size.height * 0.01,
        MediaQuery.of(context).size.width * 0.02,
        0);

    var marginCard = EdgeInsets.fromLTRB(
        MediaQuery.of(context).size.width * 0.05,
        MediaQuery.of(context).size.height * 0.01,
        MediaQuery.of(context).size.width * 0.05,
        MediaQuery.of(context).size.height * 0.01);
    return Container(
      margin: marginCard,
      padding: paddingCard,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey,
          width: 2, //                   <--- border width here
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            article.title,
            textAlign: TextAlign.justify,
            textScaleFactor: 1,
            maxLines: 5,
            softWrap: true,
            style: const TextStyle(
                fontFamily: 'AppleGaramond',
                fontWeight: FontWeight.bold,
                fontSize: 19.0,
                color: Colors.black),
          ),
          Divider(
            height: MediaQuery.of(context).size.height * 0.03,
            thickness: 2,
            indent: 0.3,
            color: Colors.grey,
          ),
          Image.network(
            imageUrl,
            width: MediaQuery.of(context).size.width * 0.7,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Text(
            article.abs,
            textAlign: TextAlign.justify,
            textScaleFactor: 1,
            maxLines: 5,
            softWrap: true,
            style: const TextStyle(
                fontFamily: 'AppleGaramond',
                fontSize: 17.0,
                color: Colors.black87),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Text(
            article.publishedDate,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 15.0,
              color: Colors.blueGrey,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
        ],
      ),
    );
  }
}
