import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class DetailNewsScreen extends StatefulWidget{
  final String newsId;

  DetailNewsScreen({this.newsId}) : super();
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DetailScreenState();
  }
}

class _DetailScreenState extends State<DetailNewsScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WebviewScaffold(
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
      url: "http://h2ksolution.com/api/get_noi_dung_tin_new?arcid=6584016",
    );
  }
}


