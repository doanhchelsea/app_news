

import 'package:appnews/model/user.dart';

import 'news.dart';

class Comment{
  User user;
  String content;
  News news;

  Comment({this.user, this.content, this.news});
}