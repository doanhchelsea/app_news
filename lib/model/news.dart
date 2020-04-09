import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:appnews/global.dart';
import 'package:flutter/foundation.dart';

class News {
  final String id;
  final String thumb;
  final String title;
  final String source;
  final String publishedDate;
  final String catid;
  final String rid;
  final int nextpage;

  News(
      {this.id,
      this.thumb,
      this.title,
      this.source,
      this.publishedDate,
      this.catid,
      this.rid,
      this.nextpage});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      id: json["id"] as String,
      thumb: json["thumb"] as String,
      title: json["title"] as String,
      source: json["source"] as String,
      publishedDate: json["publishedDate"] as String,
      catid: json["catid"] as String,
      rid: json["rid"] as String,
      nextpage: json["nextpage"] as int,
    );
  }
}

Future<List<News>> fetchNews(http.Client client) async {
  final response = await client.get(URL_NEWS);
  return compute(parseNews, response.body);
}

List<News> parseNews(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<News>((json) => News.fromJson(json)).toList();
}
