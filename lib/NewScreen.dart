import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'model/news.dart';

class NewsList extends StatelessWidget {
  final List<News> news;

  NewsList({Key key, this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return GestureDetector(
          child :Container(
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
                        new Text(news[index].title, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0)),
                        new Text(""),
                        new Text(news[index].source, style: TextStyle(color: Colors.black26 ),),
                  ],
                )),
              ],
            ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
            ),
          ),
            onTap: () {},
        );
      },
      itemCount: news.length,
    );
  }
}

class NewScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NewScreenSate();
  }
}

class _NewScreenSate extends State<NewScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("VNEXPRESS NEWS"),
      ),
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
