import 'package:appnews/utils/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;


Future<String> fetchURL(int id) async {
  final String URL_NEWS =
      URL + '/get_noi_dung_tin_new?arcid=${id}';
  var response = await http.get(URL_NEWS);

  return response.body;
}
class DetailNewsScreen extends StatefulWidget  {
  final int newsId;

  DetailNewsScreen({this.newsId}) : super();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DetailScreenState();
  }
}

class _DetailScreenState extends State<DetailNewsScreen>  {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: fetchURL(widget.newsId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Detail News"),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: (){
                  },
                )
              ],
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
}
