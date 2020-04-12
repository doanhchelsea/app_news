import 'dart:convert';
import 'package:appnews/utils/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:appnews/model/news.dart';
import 'package:flutter/foundation.dart';
import 'package:appnews/ui/DetailNewsScreen.dart';


Future<List<News>> fetchNews(http.Client client) async {
  const URL_NEWS = URL + '/get_arc_by_catid?catid=4';
  final response = await client.get(URL_NEWS);
  return compute(parseNews, response.body);
}

List<News> parseNews(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<News>((json) => News.fromJson(json)).toList();
}
class EconomyNews extends StatefulWidget {
  final Widget child;

  EconomyNews({Key key, this.child}) : super(key: key);

  _EconomyNewsState createState() => _EconomyNewsState();
}

class _EconomyNewsState extends State<EconomyNews> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: FutureBuilder(
          future: fetchNews(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
            }
            return snapshot.hasData
                ? NewsList(news: snapshot.data)
                : Center(child: CircularProgressIndicator());
          }),
    );
  }
}

class NewsList extends StatelessWidget {
  final List<News> news;

  NewsList({Key key, this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Container(
            padding: EdgeInsets.all(8.0),
            child: new Row(
              children: <Widget>[
                new Expanded(
                  flex: 1,
                  child: new Column(
                    children: <Widget>[
                      new Image.network(news[index].thumb),
                    ],
                  ),
                ),
                new Container(
                  width: 10.0,
                ),
                new Expanded(
                    flex: 3,
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text(news[index].title,
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16.0)),
                        new Text(""),
                        new Text(
                          news[index].source,
                          style: TextStyle(color: Colors.black26),
                        ),
                      ],
                    )),
              ],
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
            ),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DetailNewsScreen(newsId: news[index].id)));
          },
        );
      },
      itemCount: news.length,
    );
  }
}