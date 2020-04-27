import 'package:appnews/utils/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;

Future<String> fetchURL(int id) async {
  final String URL_NEWS = URL + '/get_noi_dung_tin_new?arcid=${id}';
  var response = await http.get(URL_NEWS);

  return response.body;
}

class DetailNewsScreen extends StatefulWidget {
  final int newsId;

  DetailNewsScreen({this.newsId}) : super();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DetailScreenState();
  }
}

class _DetailScreenState extends State<DetailNewsScreen> {
  final TextEditingController _textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Flexible(child: _buildBody(context)),
          _buildTextComposer(),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return FutureBuilder<String>(
      future: fetchURL(widget.newsId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Detail News"),
            ),
            body: new Center(
              child: SingleChildScrollView(
                child: Html(
                  data: snapshot.data,
                ),
                padding: EdgeInsets.all(8.0),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("${snapshot.error}"),
            ),
          );
        }
        return Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget _buildTextComposer() {
    return new IconTheme(
      //new
      data: new IconThemeData(color: Theme.of(context).accentColor), //new
      child: new Container(
        //modified
        padding: new EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black26),
        ),
        child: new Row(
          children: <Widget>[
            new Flexible(
                child: new Theme(
                    data: new ThemeData(
                      primaryColor: Colors.black26,
                      primaryColorDark: Colors.black26,
                    ),
                    child: new TextField(
//                      onSubmitted: ,
                      decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                        ),
                        hintText: 'Bình luận của bạn',
                      ),
                    ))),
            new Padding(
              padding: new EdgeInsets.only(bottom: 1.0),
              child: new Column(
                children: <Widget>[
                  new IconButton(
                      icon: Icon(Icons.insert_comment),
//                      onPressed: () => print('13'),
                  ),
                  new Text('13'),
                ],
              ),
            ),
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 4.0),
              child:
                  new IconButton(icon: new Icon(Icons.share), onPressed: null),
            )
          ],
        ),
      ), //new
    );
  }
}
