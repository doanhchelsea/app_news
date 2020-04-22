

import 'package:appnews/model/news.dart';

abstract class NewsRepo{
  Future<News> getNewsByCategory(String category);
}